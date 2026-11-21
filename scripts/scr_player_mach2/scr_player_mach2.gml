function scr_player_mach2()
{
    hsp = movespeed * xscale;
    var move = global.pky_right + global.pky_left;
    var _accel = 0.1;
    
    if (character == UnknownEnum.Value_3 && sprite_index == sprites.mach1)
    {
        image_speed = 0.4;
        vsp = 0;
        hsp = xscale * ((image_index * 1.5) - 8);
        
        if (animation_end())
        {
            flash = true;
            squashX = 1.4;
            squashY = 0.6;
            sprite_index = sprites.mach3;
            image_speed = 0.35;
            movespeed = 12;
            state = global.states.mach3;
        }
        
        exit;
    }
    
    if (character == UnknownEnum.Value_3 && sprite_index == sprites.mach2)
    {
        flash = true;
        squashX = 1.4;
        squashY = 0.6;
        sprite_index = sprites.mach3;
        image_speed = 0.35;
		if movespeed < 12
        movespeed = 12;
        state = global.states.mach3;
        exit;
    }
    
    if (character == UnknownEnum.Value_2)
        _accel = 0.08;
    
    if (movespeed < 6)
        movespeed = 6;
    
    if (grounded)
        movespeed += _accel;
	else if (sprite_index == spr_milton_longjump || sprite_index == spr_milton_longjumpend)
		movespeed += 0.005
		
    if global.pky_grab && grounded && (sprite_index == spr_milton_longjump || sprite_index == spr_milton_longjumpend)
    {
		if (move != 0)
	        xscale = move;
	    state = global.states.hammerattack;
	    image_index = 4;
	    sprite_index = spr_milton_hammerspin_prep
		exit
    }
    buffers.afterimageMach = approach(buffers.afterimageMach, 0, 1);
    
    if (buffers.afterimageMach <= 0)
    {
        buffers.afterimageMach = 6;
        create_machEffect(sprite_index, image_index, x, y, xscale, movespeed / 12);
    }
    
    buffers.dashcloud--;
    
    if (buffers.dashcloud <= 0 && grounded)
    {
        buffers.dashcloud = 12;
        create_particleStatic(spr_dashcloud1, x, y, xscale, 1);
    }
    
    slope_momentum();
    /*if sprite_index = sprites.mach2 && character = 10
	{
		if movespeed < 12
		movespeed = 12
        flash = true;
        state = global.states.mach3;
        
        if (sprite_index != sprites.rollgetup)
        {
            image_index = 0;
            sprite_index = sprites.mach3;
        }
	}*/
    if (animation_end() && sprite_index == sprites.mach1)
    {
        image_index = 0;
        sprite_index = sprites.mach2;
    }
    
    if (animation_end() && sprite_index == sprites.rollgetup)
    {
        image_index = 0;
        sprite_index = sprites.mach2;
    }
    
    if (animation_end() && sprite_index == sprites.mach2jump)
    {
        image_index = 0;
        sprite_index = sprites.mach2jumpend;
    }
    
    if (animation_end() && sprite_index == sprites.longjump)
    {
        image_index = 0;
        sprite_index = sprites.longjumpend;
    }
    
    if (animation_end() && sprite_index == sprites.walljumpstart)
    {
        image_index = 0;
        sprite_index = sprites.walljump;
    }
    
    if (!grounded && (sprite_index == sprites.mach2 || sprite_index == sprites.mach1))
    {
        image_index = 0;
        sprite_index = sprites.mach2jump;
    }
    
    if (grounded && (sprite_index == sprites.mach2jump || sprite_index == sprites.mach2jumpend || sprite_index == sprites.walljump || sprite_index == sprites.walljumpstart || sprite_index == sprites.longjump || sprite_index == sprites.longjumpend))
    {
        image_index = 3;
        sprite_index = sprites.mach2;
    }
    
    if (grounded && sprite_index == sprites.groundpoundcancel)
    {
        image_index = 0;
        sprite_index = sprites.rollgetup;
    }
    
    if (sprite_index == sprites.mach2)
        image_speed = movespeed / 18;
    else
        image_speed = 0.45;
    
    if (jumpstop == false && !global.pky_jump && vsp < grav)
    {
        jumpstop = true;
        vsp /= 20;
    }
    
    if (character != UnknownEnum.Value_3 && (movespeed >= 12 && grounded))
    {
        movespeed = max(movespeed, 12);
        flash = true;
        state = global.states.mach3;
        
        if (sprite_index != sprites.rollgetup)
        {
            image_index = 0;
            sprite_index = sprites.mach3;
        }
        
        exit;
    }
    
    if (jumpBuffer && coyote_time)
    {
        grounded = false;
        jumpBuffer = false;
        image_index = 0;
        sprite_index = sprites.mach2jump;
        vsp = -12;
        jumpstop = false;
        plrsnds_play(sfx.jump, x, y);
    }
    
    if (!global.pky_run && grounded)
    {
        if (sprite_index == sprites.mach1)
        {
            state = global.states.normal;
            sprite_index = sprites.idle;
            image_index = 0;
            image_speed = 0.35;
            movespeed = 0;
        }
        else
        {
            plrsnds_play(sfx.machend, x, y);
            state = global.states.machslide;
            sprite_index = sprites.machslidestart;
            image_index = 0;
        }
        
        exit;
    }
    
    if (move != xscale && move != 0 && grounded)
    {
        if (sprite_index == sprites.mach1)
        {
            xscale *= -1;
        }
        else
        {
            plrsnds_play(sfx.machturn, x, y);
            sprite_index = sprites.mach2turn;
            image_index = 0;
            state = global.states.machturn;
            exit;
        }
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x, y + 1, obj_slope) && grounded)
    {
        FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
        state = global.states.hitwall;
        sprite_index = sprites.wallsplat;
        image_index = 0;
        exit;
    }
    
    if (global.pky_down)
    {
        image_index = 0;
        sprite_index = sprites.rollstart;
        state = global.states.tumble;
        create_particleStatic(spr_grabcloud, x, y, xscale, 1);
        exit;
    }
    
    if ((place_meeting(x + sign(hsp), y, obj_solid) && !grounded) || (scr_slope(x, y + 4) && place_meeting(x + sign(hsp), y - 4, obj_solid) && !place_meeting(x + hsp, y, obj_metalblock)))
    {
        var _climb = true;
        
        if (!(character == UnknownEnum.Value_2))
            _climb = doBump(40, abs(hsp) + 1);
        
        if (_climb)
        {
						if character = 10
			{
				                verticalMovespeed = -18;
                grounded = false;
                squashX = 1.5;
                squashY = 0.5;
				plrsnds_play(sfx_skatenic_bounce, x, y);
			}
			else
            verticalMovespeed = movespeed + (character == 6);

            state = global.states.climbwall;
            sprite_index = sprites.wallclimb;
            image_index = 0;
            exit;
        }
    }
    
    if (jumpBuffer > 8 && !grounded && (global.modded_machdoublejump || character = 12) && (isMildred || character == UnknownEnum.Value_2 || character = 12))
    {
        jumpBuffer = false;
        
        if (character == UnknownEnum.Value_2)
        {
            vsp = -14;
            movespeed *= xscale;
            state = global.states.hammerwirl;
            sprite_index = spr_milton_hammerwirl;
            image_index = 0;
            plrsnds_play(sfx.jump, x, y);
            exit;
        }
                        if (character == UnknownEnum.Value_12)
        {
            vsp = -14
			jumpstop = 0
			        FMODevent_oneshot("event:/Sfx/Player/airspin", x, y);
		            
            with (create_particleStatic(spr_crazyrunothereffect, x, y, 1, 1))
            {
                image_angle = 90;
                image_speed = 0.5;
            }
            movespeed = hsp
            state = global.states.trexhover;
            sprite_index = spr_trex_hatglidestart;
            image_index = 0;
            plrsnds_play(sfx.jump, x, y);
            exit;
        }
        image_index = 0;
        FMODevent_oneshot("event:/Sfx/Player/airspin", x, y);
        vsp = -11;
        state = global.states.buzzsaw;
        image_index = 0;
        sprite_index = sprites.buzzsawBump;
    }
    
    doTaunt();
    doGrab();
}
