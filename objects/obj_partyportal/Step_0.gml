image_alpha = global.escapeActive ? 1 : 0.5;
if obj_player.character = chars.bacon5 
{
	
if (sprite_index != spr_partyportal_coolguy_intro && distance_to_object(obj_player) < 200 && global.escapeActive)
{
    depth = -100000;
    image_blend = #998E83;
    sprite_index = spr_partyportal_coolguy_intro;
    image_index = 0;
    image_speed = 0.08333333333333333;
}

if (audio_is_playing(sound))
{
    y = lerp(y, 154, 0.1);
    done = true;
    image_blend = c_white;
    
    with (obj_music)
        fmod_studio_event_instance_set_volume(escapeInst, 0.25);
    
 //   with (obj_music)
  //      audio_sound_gain(musicGm, 0.25);
    
    with (obj_player)
        visible = false;
    
    var _frm_par = 5;
    var _frm_mil = 7;
    var _frm_par_m = 9;
    var _frm_mil_s = 11;
    var _frm_mil_m0 = 12;
    var _frm_mil_m1 = 13;
    var _frm_mil_m2 = 15;
    var _frm_mil_m3 = 17;
    var _frm_mil_m4 = 19;
    var _frm_mil_m5 = 21;
    var _frm_mil_m6 = 23;
    var _t = audio_sound_get_track_position(sound);
    
    if (_t > 0.29 && _t < 2.68)
    {
        image_index = _frm_par + ((current_time % 150) < 75);
    }
    else if (_t > 2.8 && _t < 3.12)
    {
        image_index = _frm_par + ((current_time % 150) < 75);
    }
    else if (_t > 3.26 && _t < 3.64)
    {
        image_index = _frm_par + ((current_time % 150) < 75);
    }
    else if (_t > 3.82 && _t < 6.33)
    {
        if (_t > 6.15 || (_t > 4.92 && _t < 5.02))
            image_index = _frm_mil + 1;
        else
            image_index = _frm_mil;
    }
    else if (_t > 6.33 && _t < 7.71)
    {
        image_index = _frm_par + ((current_time % 150) < 75);
    }
    else if (_t > 8 && _t < 8.16)
    {
        image_index = _frm_par_m;
    }
    else if (_t > 8.16 && _t < 8.2)
    {
        image_index = _frm_par_m + 1;
    }
    else if (_t > 8.2 && _t < 8.39)
    {
        image_index = _frm_par_m;
    }
    else if (_t > 8.39 && _t < 8.8)
    {
        image_index = _frm_par_m + 1;
    }
    else if (_t > 8.8 && _t < 9)
    {
        image_index = _frm_mil_s;
    }
    else if (_t > 9 && _t < 9.96)
    {
        image_index = _frm_mil_m1;
    }
    else if (_t > 9.96 && _t < 10.12)
    {
        image_index = _frm_mil_m1 + 1;
    }
    else if (_t > 10.12 && _t < 10.2)
    {
        image_index = _frm_mil_m2;
    }
    else if (_t > 10.2 && _t < 10.4)
    {
        image_index = _frm_mil_m3;
    }
    else if (_t > 10.4 && _t < 10.89)
    {
        image_index = _frm_mil_m4;
    }
    else if (_t > 10.89 && _t < 11.48)
    {
        image_index = _frm_mil_m5;
    }
    else if (_t > 11.48 && _t < 11.96)
    {
        image_index = _frm_mil_m6;
    }
    else if (_t > 11.96)
    {
        image_index = _frm_mil_m0;
    }
    else
    {
        image_index = _frm_par;
    }
    
    if (_t > 0.29 && _t < 2.68)
    {
        st = "BLOW YOUR PARTY POPPERS SOMEWHERE ELSE KID!";
    }
    else if (_t > 2.8 && _t < 3.64)
    {
        st = "THIS AINT THE PLACE.";
    }
    else if (_t > 3.82 && _t < 6.33)
    {
        if (_t > 4.98)
            st = "Tell me, popper...";
        else
            st = "Oh really?";
    }
    else if (_t > 6.33 && _t < 7.71)
    {
        st = "YOUR INTRUDING MY PROPERTY.";
    }
    else if (_t > 8 && _t < 8.2)
    {
        st = "GET";
    }
    else if (_t > 8.2 && _t < 8.39)
    {
        st = "GET OUT!";
    }
    else if (_t > 8.8 && _t < 9)
    {
        st = "...";
    }
    else if (_t > 9 && _t < 10.14)
    {
        st = "How offensive..";
    }
    else if (_t > 10.14 && _t < 11.94)
    {
        st = "I'd need to find another way out on how exit this..";
    }
    else if (_t > 14.4)
    {
        st = "yay im so happy to be the subtitle man yayaya";
    }
    else if (_t > 11.94)
    {
        st = "p l a c e";
    }
    
    if (_t > 8.2)
        global.escapeLap = 2;
}
else if (sprite_index == spr_partyportal_coolguy_intro && !done)
{
    image_blend = merge_colour(#998E83, c_white, clamp(image_index / 5, 0, 1));
    y = lerp(y, 154, 0.035);
    
    with (obj_music)
        fmod_studio_event_instance_set_volume(escapeInst, 1 - (clamp(image_index / 5, 0, 1) * 0.75));
    
    with (obj_player)
    {
        hsp = 0;
        vsp = 0;
        image_speed = 0;
        state = -4;
    }
    
    if (round(image_index) == 5)
    {
        sound = audio_play_sound(sfx_fialogue1_bacon5, 1, 0);
        image_speed = 0;
    }
}
else if (sprite_index == spr_partyportal_coolguy_intro && done)
{
    ds_list_clear(global.escaperoom);
	 ds_list_add(global.saveroom, id);
    global.escapeLap = 2;
	    with (obj_music)
    fmod_studio_event_instance_set_volume(escapeInst, 1)
   // with (obj_music)
        //audio_sound_gain(musicGm, audio_sound_get_gain(mu_lap2_bacon5), 1000);
     global.collect += 3000
    with (obj_player)
    {
        visible = true;
        state = global.states.normal;
        sprite_index = sprites.idle;
    }
    
    with (obj_hud)
        visible = false;
    
    instance_destroy();
    exit;
}

if (sprite_index == spr_partyportal_coolguy_intro)
{
    with (obj_hud)
        visible = false;
}
	exit;
}
if (place_meeting(x, y, obj_player) && cutscene == false && global.escapeActive && canEnter)
{
    global.collect += 3000 * (global.escapeLap + 1);
    
    if (global.escapeLap >= 2)
        ds_list_add(global.saveroom, id);
    
    cutscene = true;
    
    with (obj_player)
    {
        targetRoom = other.targetRoom;
        door = other.targetDoor;
        state = -4;
        sprite_index = spr_player_spinout;
        image_speed = 0.35;
    }
    
    sprite_index = spr_partydooropen;
    image_index = 0;
}

if (cutscene == true)
{
    with (obj_player)
    {
        vsp = 0;
        hsp = 0;
        x = approach(x, other.x, 3);
        y = approach(y, other.y, 3);
        xscaleMulti = approach(xscaleMulti, 0, 0.05);
        yscaleMulti = approach(yscaleMulti, 0, 0.05);
        movespeed = 0;
    }
    
    if (animation_end() && sprite_index == spr_partydooropen)
    {
        image_index = image_number - 1;
        scr_fadeout();
        ds_list_clear(global.escaperoom);
    }
}
