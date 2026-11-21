with (obj_music)
{
    if (musicInst != -4)
    {
        fmod_studio_event_instance_stop(musicInst, UnknownEnum.Value_1);
        fmod_studio_event_instance_release(musicInst);
    }
    
    if (secretInst != -4)
    {
        fmod_studio_event_instance_stop(secretInst, UnknownEnum.Value_1);
        fmod_studio_event_instance_release(secretInst);
    }
    
    musicInst = -4;
    secretInst = -4;
    music = 
    {
        regular: "",
        secret: ""
    };
    savedMusicPosition = 0;
    isSecret = false;
}

obj_pause.buffer = 1000;
global.collect = 0;
global.combo.timer = 1000;
global.escapeActive = 0;
global.key = true;

with (obj_keydoor)
{
	if (ds_list_find_index(global.saveroom, id) == -1)
	ds_list_add(global.saveroom, id);
	 
    sprite_index = spr_door;
}
if (global.prophuntmode.waitphase)
{
    if (global.prophuntmode.select == -4)
    {
        with (obj_player)
        {
            state = -4;
            visible = 0
            if (sprite_index != sprites.gateslam)
            {
                image_index = 0;
                image_speed = 0.3;
                sprite_index = sprites.gateslam;
            }
            
            if (animation_end())
                image_speed = -0.6;
            
            if (image_index < 1 && image_speed < 0)
                image_speed = 0.3;
        }
    }
    
    if (audio_sound_get_asset(global.music) != mu_prophunt_waiting)
        scr_music(mu_prophunt_waiting, true);
}
else
{
    if (global.prophuntmode.select == -4)
    {
        audio_sound_pitch(mu_prophunt, 1);
        
        with (obj_player)
        {
            if (state == -4)
			{
                        state = global.states.walkfront;
		                sprite_index = sprites.walkfront;
                image_index = 0;
visible = 1
			}
        }
    }
    else if (instance_exists(obj_player))
    {
        var hunterpitching = global.prophuntmode.overtime ? 1.5 : 1;
        
        with (obj_onlinePlayer)
        {
            if (hunter && room == currentRoom)
            {
                var _new = 1 + (clamp((960 - distance_to_object(obj_player)) / 960, 0, 1) / 2);
                
                if (hunterpitching < _new)
                    hunterpitching = _new;
            }
        }
        
        audio_sound_pitch(mu_prophunt, hunterpitching);
        
        with (obj_onlinePlayer)
        {
            if (distance_to_object(obj_player) < 25 && hunter && room == currentRoom && other.win != 1)
            {
                var _name = name;
                obj_player.image_alpha = 1;
                global.prophuntmode.select = -4
				if global.prophuntmode.overtime
                global.prophuntmode.timer += 25 * 1.3
                with (obj_onlineHandler)
                {
                    lastestMessageNum = wrap(lastestMessageNum + 1, 123, 233);
                    lastestMessage = lang_get_phrase("online_prophunt_caught") + _name;
                }
                
                break;
            }
        }
    }
    
    if (audio_sound_get_asset(global.music) != mu_prophunt)
        scr_music(mu_prophunt, true);
}

if (instance_exists(obj_player))
{
    if (global.prophuntmode.select >= 0)
    {
        instance_destroy(obj_stupidcabbit, false);
        sprite_index = (obj_player.movespeed > 1) ? global.prophuntmode.sprites[global.prophuntmode.select][1] : global.prophuntmode.sprites[global.prophuntmode.select][0];
        image_speed = 0.35;
    }
}
