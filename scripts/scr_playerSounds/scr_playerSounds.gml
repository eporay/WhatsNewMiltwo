global.plrsnds_gmsnd = ds_map_create();
global.plrsnds_gmsndact = ds_map_create();

function plrsnds_play(arg0, arg1, arg2)
{
    if (is_string(arg0))
    {
        FMODevent_oneshot(arg0, arg1, arg2);
    }
    else
    {
        if (is_array(arg0))
            arg0 = arg0[irandom(array_length(arg0) - 1)];
        
        var _pitch = random_range(0.9, 1.1);
        var _sfx = scr_soundeffect(arg0, _pitch, false);
        audio_sound_gain(_sfx, global.SfxVolume * audio_sound_get_gain(arg0), 0);
    }
}

function plrsnds_gmsnd_preload(arg0, arg1)
{
    if (!ds_map_exists(global.plrsnds_gmsnd, arg0))
    {
        if (arg1)
        {
            global.plrsnds_gmsnd[? arg0] = [];
            global.plrsnds_gmsndact[? arg0] = [];
            var _sfxid = asset_get_index(arg0 + "1");
            var i = 0;
            
            while (_sfxid >= 0)
            {
                if (_sfxid >= 0)
                {
                    array_push(global.plrsnds_gmsnd[? arg0], _sfxid);
                    array_push(global.plrsnds_gmsndact[? arg0], -4);
                }
                
                i++;
                _sfxid = asset_get_index(arg0 + string(i + 1));
            }
        }
        else
        {
            global.plrsnds_gmsnd[? arg0] = asset_get_index(arg0);
            global.plrsnds_gmsndact[? arg0] = -4;
        }
    }
}

function plrsnds_event(arg0, arg1, arg2 = -1)
{
    if (is_real(arg1))
    {
        if (arg0)
        {
            fmod_studio_event_instance_set_paused(arg1, false);
            
            if (!FMODevent_isplaying(arg1))
                fmod_studio_event_instance_start(arg1);
            
            FMODSet3dPos(arg1, x, y);
            
            if (arg2 > 0)
            {
                if (fmod_studio_event_instance_get_parameter_by_name(arg1, "state") != arg2)
                    fmod_studio_event_instance_set_parameter_by_name(arg1, "state", arg2);
            }
        }
        else
        {
            fmod_studio_event_instance_stop(arg1, UnknownEnum.Value_1);
        }
    }
    else if (arg2 >= 0)
    {
        plrsnds_gmsnd_preload(arg1, 1);
        var _snd = global.plrsnds_gmsnd[? arg1];
        
        if (arg0)
        {
            for (var j = 0; j < array_length(_snd); j++)
            {
                if (j != arg2)
                    audio_stop_sound(_snd[j]);
                else if (!audio_is_playing(array_get(global.plrsnds_gmsndact[? arg1], j)))
                    array_set(global.plrsnds_gmsndact[? arg1], j, scr_soundeffect(_snd[j]));
                
                audio_sound_gain(array_get(global.plrsnds_gmsndact[? arg1], j), global.SfxVolume * 1.5 * audio_sound_get_gain(_snd[arg2]), 0);
            }
        }
        else
        {
            for (var j = 0; j < array_length(global.plrsnds_gmsndact[? arg1]); j++)
                audio_stop_sound(array_get(global.plrsnds_gmsndact[? arg1], j));
        }
    }
    else
    {
        plrsnds_gmsnd_preload(arg1, 0);
        var _snd = global.plrsnds_gmsnd[? arg1];
        
        if (arg0)
        {
            if (!audio_is_playing(global.plrsnds_gmsndact[? arg1]))
                global.plrsnds_gmsndact[? arg1] = scr_soundeffect(_snd);
            
            audio_sound_gain(global.plrsnds_gmsndact[? arg1], global.SfxVolume * 3 * audio_sound_get_gain(_snd), 0);
        }
        else if (audio_is_playing(global.plrsnds_gmsndact[? arg1]))
        {
            audio_stop_sound(global.plrsnds_gmsndact[? arg1]);
        }
    }
}

function playerSounds()
{
    var s = 0;
    plrsnds_event((state == global.states.tumble && !skatenic_is_tornado()), sfx.roll);
    s = 0;
    
    if (abs(movespeed) > 0)
        s = abs(movespeed) / 12;
     plrsnds_event(skatenic_is_tornado(), sfx_skatenic_drill);
	 plrsnds_event(sprite_index = spr_skatenic_wallclimbcancel, sfx_skatenic_sidespin);
    plrsnds_event(state == global.states.hammerattack, sfx.hammer, s);
    plrsnds_event(state == global.states.groundpoundstart || state == global.states.groundpound, sfx.groundpound);
    plrsnds_event(sprite_index == spr_milton_dive || sprite_index = spr_milton_superjump, sfx.hammerair);
    plrsnds_event(state == global.states.superjumpprep, sfx.sjump);
    plrsnds_event(state == global.states.skateboardmove, sfx.skateboard);
    plrsnds_event(state == global.states.skateboardAim, sfx.skateaim);
    plrsnds_event(state == global.states.grab, sfx.grab);
    plrsnds_event((state == global.states.retwistedBuzzsaw || sprite_index == spr_player3_spinnygroundpound) && character == UnknownEnum.Value_7, "sfx_player_bt_ballspin");
    s = 0;
        if (state == global.states.mach2 && sprite_index = sprites.mach1)
        s = 1;
    else if (state == global.states.mach2 && sprite_index != sprites.mach1)
        s = 1;
    else if (state == global.states.mach3 && sprite_index != sprites.crazyrun)
        s = 2;
    else if (state == global.states.mach3 && sprite_index == sprites.crazyrun)
        s = 3;
    
    plrsnds_event(state == global.states.mach2 || state == global.states.mach3 || (state == global.states.climbwall && character != 10), sfx.mach, s);
}
