if (global.mky_jump2 && global.escapeLap == 3)
{
    alarm[1] = -1;
    event_user(0);
    exit;
}
image_xscale = lerp(image_xscale, 1, 0.25);
with (obj_player)
{
    if (sprite_index == sprites.gateslam)
    {
        state = -4;
        xscale = 1;
        x = 480;
        y = 270;
        visible = true;
        xscaleMulti = 1;
        yscaleMulti = 1;
        squashY = 1;
        squashX = 1;
        hsp = 0;
        vsp = 0;
        
        if (animation_end())
            image_index = image_number - 1;
        
        if (place_meeting(x, y, obj_timesup))
        {
            hsp = 4;
            vsp = -10;
            sprite_index = spr_player_gameover;
			other.image_xscale = 1.5
			FMODevent_oneshot("event:/Sfx/Player/punch", x, y);
			if irandom(100) <= 25
			{
				var bacontu = character =0 
				if global.jarona && global.VoiceClips = 2
				{
					bacontu = 0
				}
				if global.VoiceClips = 0
				{
				}
				else
				{
				if !bacontu
				plrsnds_play(sfx.voice_hurt, x, y);
				else
			FMODevent_oneshot("event:/Sfx/Player/baconscream", x, y);
				}
			}
			plrsnds_play(sfx.slam, x, y);
			 repeat (8)
                    {
                        create_particleDebri(spr_baddie_gibs, irandom_range(0, sprite_get_number(spr_baddie_gibs)), x, y, 1, -5);
                        create_particleDebri(spr_slapstar, irandom_range(0, sprite_get_number(spr_slapstar)), x, y, 1, -5);
                    }
                    
                    create_particleStatic(spr_kungfueffect, x, y, 1, 2);
                    
        }
    }
}

if (falling)
{
    y = approach(y, 540 / 2, vsp);
    vsp += 1;
}
	    blurbuffer = approach(blurbuffer, 0, 1);
    if (blurbuffer == 0)
    {
        blurbuffer = 3;
        create_blur_effect(sprite_index, image_index, x, y, image_xscale);
    }