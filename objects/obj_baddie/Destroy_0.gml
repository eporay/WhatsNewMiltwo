var _saveroom = escape ? global.escaperoom : global.saveroom;

if (ds_list_find_index(_saveroom, id) == -1)
{
    FMODevent_oneshot("event:/Sfx/General/Enemy/killenemy", x, y);
    ds_list_add(_saveroom, id);
    global.combo.timer = 60;
    
    if (!spawned)
    {
        global.combo.amt += 1;
        
        if (!supertauntKill)
            obj_player.supertaunt++;
    }
    
    shake_camera(5, 10);
    if (instance_exists(obj_player) && obj_player.character == chars.milton)
    {
        with (obj_player)
        {
            if (irandom(100) <= 25)
                plrsnds_play(sfx.laugh, x, y);
            
            FMODevent_oneshot("event:/Sfx/Player/punch", x, y);
        }
        
        shake_camera(10, 20);
        plrsnds_play(sfx_playerT_sprayBase, x, y);
        var _t = (global.combo.amt % 10) == 0;
        audio_sound_gain(scr_soundeffect(_t ? sfx_playerT_sprayHit2 : sfx_playerT_sprayHit1, 1 + (((global.combo.amt - 10) div 10) / 30) + ((!_t * (global.combo.amt % 10)) / 25)), 2, 0);
        
        with (create_particleStatic(spr_sprayeffect_milton, x, y, 1, -2))
        {
            pal_spr = pal_sprayeffect_milton;
            pal_ind = irandom(sprite_get_width(pal_spr) - 1);
        }
        
        create_particleStatic(spr_kungfueffect, x, y, 1, -2);
    }
    else
    {
        shake_camera(5, 10);
        create_particleStatic(spr_genericpoofeffect, x, y, 1, -2);
    }
    
    with (instance_create(x, y, obj_baddiedead))
        sprite_index = other.spr_dead;
    
    repeat (8)
    {
        create_particleDebri(spr_baddie_gibs, irandom_range(0, sprite_get_number(spr_baddie_gibs)), x, y, 1, -5);
        create_particleDebri(spr_slapstar, irandom_range(0, sprite_get_number(spr_slapstar)), x, y, 1, -5);
       
    }
}
if object_index == obj_biggiebag
{
	FMODevent_oneshot("event:/Sfx/General/Enemy/balloonsplat", x, y)
	instance_create(x, y, obj_biggiebag_splash).blend = #ffad5a
}