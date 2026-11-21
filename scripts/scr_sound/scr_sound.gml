global.music = -4;
global.music_old = -4;
global.music_mult = -4;
global.music_multold = -4;
global.music_fade = 1;

function scr_soundeffect(arg0, arg1 = 1, arg2 = false)
{
    var _id = audio_play_sound(arg0, 1, arg2);
    audio_sound_pitch(_id, arg1);
    return _id;
}

function scr_music(arg0, arg1 = false, arg2 = false)
{
    global.music_fade = 1;
    var _pos = 0;
    
    if (arg1)
    {
        global.music_fade = 0;
        
        if (audio_is_playing(global.music_old))
            audio_stop_sound(global.music_old);
        
        if (audio_is_playing(global.music))
            global.music_old = global.music;
        else
            global.music_old = -4;
        
        global.music_multold = global.music_mult;
        _pos = arg2 ? audio_sound_get_track_position(global.music) : 0;
        global.music = -4;
    }
    else if (audio_is_playing(global.music))
    {
        _pos = arg2 ? audio_sound_get_track_position(global.music) : 0;
        audio_stop_sound(global.music);
    }
    
    if (audio_exists(arg0))
    {
        global.music_mult = audio_sound_get_gain(arg0);
        global.music = audio_play_sound(arg0, 10, 1, 0, _pos, 1);
    }
    else
    {
        global.music_mult = 1;
        global.music = -4;
    }
    
    return global.music;
}
