function scr_player_tumble()
{
	var newmilt = 1
	var move = global.pky_right + global.pky_left;
    
     if (character == UnknownEnum.Value_2 && !grounded)
    {
        if (vsp < 13)
            vsp = 13;
        
        if (movespeed < 6)
            movespeed = 6;
        
        if (move != 0)
        {
            xscale = move;
            
            if (xscale != sign(hsp))
                hsp = approach(hsp, movespeed * move, 2);
            else
                hsp = approach(hsp, movespeed * move, 1);
        }
    }
    else if (skatenic_is_tornado())
    {
        image_speed = 0.5 * xscale;
        vsp = 24;
        movespeed = max(movespeed, 12);
        
        if (move != 0)
        {
            hsp = approach(hsp, movespeed * move, 1);
            
            if (move != xscale )
                movespeed = 12;
        }
        else
        {
            hsp = approach(hsp, 0, 1);
        }
    }
    else
    {
		hsp = movespeed * xscale;
    if (movespeed < 6)
        movespeed = 6;
    
    if (sprite_index != sprites.dive && sprite_index != spr_milton_diveprep)
        image_speed = movespeed / 18;
    else
        image_speed = 0.5;
	}
    buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
    buffers.dashcloud--;
    
    if (buffers.dashcloud <= 0 && grounded)
    {
        buffers.dashcloud = 12;
        if (skatenic_is_tornado())
        {
            buffers.dashcloud = max(1, 12 - (abs(hsp) / 3));
            
            if (abs(hsp) > 3)
                create_particleStatic(spr_dashcloud1, x, y, sign(hsp), 1);
        }
        else
        {
            create_particleStatic(spr_dashcloud1, x, y, xscale, 1);
        }
    }
    
    if (buffers.afterimageBlur == 0)
    {
        buffers.afterimageBlur = 3;
        create_blur_effect(sprite_index, image_index, x, y, xscale);
    }
    
    slope_momentum();
    crouchslip--;
    
    if ((sprite_index == sprites.rolling ||  sprite_index == spr_skatenic_diveground || sprite_index == sprites.crouchslip || sprite_index == sprites.rollstart) && !grounded)
    {
        FMODevent_oneshot("event:/Sfx/Player/dive", x, y);
        sprite_index = sprites.dive;
        image_index = 0;
        vsp = 10;
    }
    
    if (sprite_index == sprites.dive || sprite_index == spr_milton_diveprep) && !skatenic_is_tornado()
    {
		            if (global.pky_grab2 && sprayCans >= 1 && character = 11)
    {
        sprayCans--;
        state = global.states.skateboardAim;
        verticalMovespeed = vsp;
        movespeed = hsp;
    }
        if (jumpBuffer && !grounded )
        {
            vsp = -6;
            sprite_index = sprites.divebomb;
			            if (character == UnknownEnum.Value_2)
                sprite_index = sprites.groundpoundstart;
            image_index = 0;
            state = global.states.groundpoundstart;
            squashX = 1.3;
            squashY = 0.8;
        }
    }
	if skatenic_is_tornado() && !global.pky_down && slapBuffer > 0
	
	{
		slapBuffer = false;
            state = global.states.mach2;
            movespeed = 13;
            scale = 1.7;
            image_speed = 0.5;
            image_index = 0;
            sprite_index = spr_skatenic_wallclimbcancel;
            vsp = -7;
            jumpstop = true;
            flash = true;
            
            if (sign(move) != 0)
                xscale = sign(move);
            else if (sign(hsp) != 0)
                xscale = sign(hsp);
	}
        if ((scr_solid(x, y - 16) || (slapBuffer > 0 && global.pky_down)) && skatenic_is_tornado())
    {
        if (sign(move) != 0)
            xscale = sign(move);
        else if (sign(hsp) != 0)
            xscale = sign(hsp);
        
        if (slapBuffer > 0)
        {
            slapBuffer = false;
            create_particleStatic(spr_superdashcloud, x, y, xscale, 1);
        }
        
        sprite_index = sprites.rolling;
        image_index = 0;
    }
    if (character == UnknownEnum.Value_2)
    {
        if (sprite_index == spr_milton_diveprep && animation_end())
            sprite_index = sprites.dive;
        
        if (jumpBuffer && !scr_solid(x, y - 16) && grounded)
        {
            state = global.states.hammerwirl;
            flash = true;
            vsp = -16;
            squashX = 1.3;
            squashY = 0.8;
            movespeed = hsp;
            FMODevent_oneshot("event:/Sfx/Player/hammerbounce", x, y);
            image_index = 0;
            sprite_index = spr_milton_hammerwirl;
            exit;
        }
		if (sprite_index == spr_milton_dive)
        {
            if (global.pky_grab2)
            {
                if (move != 0)
                    xscale = move;
                if global.pky_down = 0
                vsp = -8;
                buffers.hammer = 25;
                slapBuffer = false;
                        image_index = 0;
        sprite_index = sprites.longjump;
        state = global.states.mach2;
        jumpstop = 1;
        plrsnds_play(sfx.jump, x, y);
                create_particleStatic(spr_crazyrunothereffect, x, y, xscale, 1).image_speed = 0.5;
                create_particleStatic(spr_grabcloud, x, y, xscale, 1);
                
                if (movespeed < 12)
                    movespeed = 12;
                

            }
        }
    }
    
    if (sprite_index == sprites.dive && grounded)
    {
        if (character == UnknownEnum.Value_7 || character == UnknownEnum.Value_6)
        {
            if (character == UnknownEnum.Value_7)
                scr_soundeffect(sfx_player_bt_ballbounce);
            
            vsp = -14;
            state = global.states.retwistedBuzzsaw;
            exit;
        }
        if character = 10
		sprite_index = spr_skatenic_diveground
		else
		{
        sprite_index = sprites.rollstart;
        image_index = 0;
		}
    }
    
    if (sprite_index == sprites.rollstart && animation_end())
    {
        sprite_index = sprites.rolling;
        image_index = 0;
    }
    
    if (grounded && jumpBuffer && !scr_solid(x, y - 16) && character == UnknownEnum.Value_5)
    {
        jumpstop = false;
        sprite_index = spr_player1_grabspinny;
        image_index = 0;
        state = global.states.dreambounce;
        vsp = -15;
    }
    var noslowmilton = 1
	if !noslowmilton
	{
    if (character == UnknownEnum.Value_2 && movespeed > 6)
        movespeed -= 0.02;
	}
    if ((character == UnknownEnum.Value_2 && !grounded) && (place_meeting(x + xscale + hsp, y - 6, obj_solid) && !place_meeting(x, y - 6, obj_solid)))
    {
        FMODevent_oneshot("event:/Sfx/Player/hammerbounce", x, y);
        create_particleStatic(spr_miltonEffect, x + (5 * xscale), y, 1, -2);
        xscale *= -1;
        movespeed = min(20, max(movespeed, (move != 0) ? 17 : 8));
        hsp = xscale * movespeed;
        squashX = 1.3;
        squashY = 0.8;
    }
    else if (!skatenic_is_tornado() && ((place_meeting(x + xscale, y, obj_solid) && !scr_slope(x + xscale, y + 1)) || (place_meeting(x + xscale, y - 6, obj_solid) && !place_meeting(x, y - 6, obj_solid))))
    {
        if (character == UnknownEnum.Value_2)
        {
            FMODevent_oneshot("event:/Sfx/Player/hammerbounce", x, y);
            create_particleStatic(spr_miltonEffect, x + (5 * xscale), y, 1, -2);
            xscale *= -1;
            movespeed = min(20, max(movespeed + 1, 8));
            hsp = xscale * movespeed;
            squashX = 1.3;
            squashY = 0.8;
        }
        else if (character == UnknownEnum.Value_7 && sprite_index == sprites.dive)
        {
            xscale *= -1;
            create_particleStatic(spr_dreambounceeffect, x, y, 1, -2);
            FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
        }
        else
        {
            crouchslip = 0;
            FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
            state = global.states.hitwall;
            sprite_index = sprites.wallsplat;
            image_index = 0;
        }
    }
    
    
    if (!global.pky_down && !scr_solid(x, y - 16) && grounded && (crouchslip <= 0 || skatenic_is_tornado()))
    {
		if (skatenic_is_tornado())
        {
            verticalMovespeed = -12;
            movespeed = abs(hsp);
            grounded = false;
            scale = 1.35;
            state = global.states.climbwall;
			plrsnds_play(sfx_skatenic_bounce, x, y);
            sprite_index = sprites.wallclimb;
        }
        else
        {
        plrsnds_play(sfx.rollgetup, x, y);
        image_index = 0;
        sprite_index = sprites.rollgetup;
		if character = 11
		state =global.states.skateboardmove
		else
        state = global.states.mach2;
		}
    }
	if skatenic_is_tornado()
	doTaunt()
}
