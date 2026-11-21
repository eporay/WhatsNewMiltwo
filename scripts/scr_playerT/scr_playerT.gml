function scr_player_hammerattack()
{
    hsp = movespeed * xscale;
    
	if movespeed < 14
	    movespeed += 0.5
	else if movespeed < 17
		movespeed += 0.01
	else if movespeed < 24
		movespeed += 0.005
    
    buffers.hammer = approach(buffers.hammer, 0, 1);
    
    if (movespeed >= 7)
    {
        buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
        
        if (buffers.afterimageBlur == 0)
        {
            buffers.afterimageBlur = 5;
            create_miltonAfterimage(sprite_index, image_index, x, y, xscale);
        }
    }
    	if !grounded
	{
        image_index = 0;
        sprite_index = sprites.longjump;
        state = global.states.mach2;
        jumpstop = false;
        plrsnds_play(sfx.jump, x, y);
		exit
	}
    buffers.dashcloud--;
    if (buffers.dashcloud <= 0)
    {
        buffers.dashcloud = floor(max(1,12-max(0,(movespeed-7)/1.66)));
        create_particleStatic(spr_dashcloud1, x, y, xscale, 1);

    }
	if movespeed >= 16
	{
		if !hammerexplodeeffect
		{

            FMODevent_oneshot("event:/Sfx/Player/punch", x, y);
        
        
        FMODevent_oneshot("event:/Sfx/General/Enemy/dart", x, y);
		plrsnds_play(sfx.slam, x, y);
		squashX = 1.7
        //create_particleStatic(spr_miltonEffect, (x + (xscale * 48)) / 2, ( y + (1 * 32)) / 2, 1, depth + 1);
        create_particleStatic(spr_parryeffect,  (x + (xscale * 48)), ( y + (1 * 32)), 1, depth + 1);
        flash = 1
        repeat (8)
        {
            with (create_particleStatic(choose(spr_supertaunteffect1, spr_supertaunteffect2, spr_supertaunteffect3, spr_supertaunteffect4), x + (xscale * 48) + irandom_range(24, -24), y + (1 * 32) + irandom_range(16, -16), 1, depth + 1))
            {
                image_speed = random_range(0.1, 0.4);
                hsp = random_range(-8, 8);
                vsp = random_range(-8, 8);
            }
        }
			hammerexplodeeffect =1
		}
	buffers.bigdashcloud--;

	}
        if (buffers.bigdashcloud <= 0)
    {
        buffers.bigdashcloud = floor(max(1,12-max(0,(16-7)/1.66)));


		create_particleStatic(spr_shineeffect, x, y,1, 1);
    }
    if (global.pky_down2 && grounded)
    {
        FMODevent_oneshot("event:/Sfx/Player/crouchslide", x, y);
        crouchslip = 25;
        sprite_index = sprites.crouchslip;
        image_index = 0;
        state = global.states.tumble;
        
        if (movespeed < 12)
            movespeed = 12;
        
        create_particleStatic(spr_superdashcloud, x, y, xscale, 1);
    }
    
    if (global.pky_down2 && !grounded)
    {
        image_index = 0;
        sprite_index = sprites.rolling;
        state = global.states.tumble;
        movespeed = abs(movespeed);
        
        if (movespeed < 12)
            movespeed = 12;
    }
    
    if (jumpBuffer && coyote_time)
    {
        jumpBuffer = false;
        image_index = 0;
        sprite_index = sprites.longjump;
        state = global.states.mach2;
        vsp = -12;
        jumpstop = false;
        plrsnds_play(sfx.jump, x, y);
    }
    
    if (!global.pky_grab)
    {
        flash = true;
        state = global.states.mach3;
        image_index = 0;
        sprite_index = sprites.mach3;
    }
    
    if (animation_end() && sprite_index == spr_milton_hammerspin_prep)
    {
        image_index = 0;
        sprite_index = spr_milton_hammerspin;
    }
    if (animation_end() && sprite_index == spr_milton_hammerspin_prep_mach4)
    {
        image_index = 0;
        sprite_index = spr_milton_hammerspin_mach4;
    }
    if (vsp >= 2)
        vsp += 0.5;
    
    if ((place_meeting(x + sign(hsp), y, obj_solid) && !scr_slope(x, y + 1)) || (place_meeting(x + sign(hsp), y - 6, obj_solid) && !place_meeting(x, y - 6, obj_solid)))
    {
        state = global.states.hammerwirl;
        xscale *= -1;
        movespeed = 9 * xscale;
        flash = true;
        vsp = -16;
        squashX = 1.3;
        squashY = 0.8;
        FMODevent_oneshot("event:/Sfx/Player/hammerbounce", x, y);
        image_index = 0;
        sprite_index = spr_milton_hammerwirl;
    }
    
    if (sprite_index == spr_milton_hammerspin_prep || sprite_index = spr_milton_hammerspin_prep_mach4)
        image_speed = 0.35;
    else
        image_speed = 0.5;
		if movespeed >= 16
		{
			if sprite_index = spr_milton_hammerspin_prep
			{
				sprite_index = spr_milton_hammerspin_prep_mach4
			}
			else 			if sprite_index = spr_milton_hammerspin
			{
				sprite_index = spr_milton_hammerspin_mach4
			}
		image_speed *= 1.3
		}
}

function scr_player_hammerwirl()
{
    hsp = movespeed;
    var move = global.pky_right + global.pky_left;
	if abs(movespeed) > 12
	movespeed = approach(movespeed, move * abs(movespeed), 0.6);
	else
    movespeed = approach(movespeed, move * 12, 0.6);
    
    if (grounded && vsp >= 0)
    {
        movespeed = abs(movespeed);
        
        if (move != 0)
            xscale = move;
        
        if (global.pky_run)
        {
			movespeed = hsp * xscale
			movespeed = abs(hsp)
			if movespeed < 13
            movespeed = 13;
            flash = true;
            state = global.states.mach3;
            image_index = 0;
            sprite_index = sprites.mach3;
        }
        else
        {
            movespeed = abs(movespeed);
            state = global.states.normal;
            image_index = 0;
            sprite_index = (move != 0) ? sprites.land2 : sprites.land;
        }
    }
    
    if (global.pky_down2 && !grounded)
    {
        image_index = 0;
        sprite_index = sprites.rolling;
        state = global.states.tumble;
        movespeed = abs(movespeed);
        
        if (movespeed < 12)
            movespeed = 12;
        
        if (move != 0)
            xscale = move;
    }
    
    if ((place_meeting(x + sign(hsp), y, obj_solid) && !scr_slope(x, y + 1)) || (place_meeting(x + sign(hsp), y - 6, obj_solid) && !place_meeting(x, y - 6, obj_solid)))
    {
        xscale = sign(hsp);
        movespeed = abs(movespeed);
        
        if (movespeed < 12)
            movespeed = 12;
        
        verticalMovespeed = movespeed;
        state = global.states.climbwall;
        sprite_index = sprites.wallclimb;
    }
    
    if (vsp >= 2)
        vsp += 0.5;
    
    buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
    
    if (buffers.afterimageBlur == 0)
    {
        buffers.afterimageBlur = 3;
        create_miltonAfterimage(sprite_index, image_index, x, y, xscale);
    }
    
    doGrab();
    image_speed = 0.5;
}
