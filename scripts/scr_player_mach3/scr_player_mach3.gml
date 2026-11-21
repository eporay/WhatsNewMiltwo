function scr_player_mach3()
{
    hsp = movespeed * xscale;
    
    if (movespeed < 12)
        movespeed = approach(movespeed, 12, 0.6);
    
    if (sprite_index == sprites.superjumpcancel)
        image_speed = lerp(image_speed, 0.5, 0.15);
    else
        image_speed = ((character != UnknownEnum.Value_3) ? (sprite_index == sprites.crazyrun) : (movespeed >= 16)) ? 0.6 : 0.35;
    
    if (!instance_exists(chargeeffect))
        chargeeffect = instance_create(x, y, obj_chargeeffect);
    
    if (!instance_exists(speedlineseffect))
        speedlineseffect = instance_create(x, y, obj_speedlines);
    
    buffers.bigdashcloud--;
    
    if (buffers.bigdashcloud <= 0 && grounded)
    {
        buffers.bigdashcloud = 24;
        create_particleStatic(spr_superdashcloud, x, y, xscale, 1);
    }
    
    buffers.crazyothereffect--;
    
    if (buffers.crazyothereffect <= 0 && sprite_index == sprites.crazyrun)
    {
        buffers.crazyothereffect = 9;
        create_particleStatic(spr_crazyrunothereffect, x, y, xscale, 1).image_speed = 0.5;
    }
    
    var move = global.pky_right + global.pky_left;
    var _accel;
    
    if (character == UnknownEnum.Value_2)
        _accel = movespeed >= 22 ? 0.075 : 0.0175;
    else
        _accel = mach4mode ? 0.1 : 0.025;
    if character = chars.juan && !mach4mode
	_accel = 0.1 + 0.01
    if (move == xscale && grounded && movespeed < 20)
        movespeed = approach(movespeed, 20, _accel);
    
    if (animation_end() && sprite_index == sprites.buzzsawCancel)
        image_index = image_number - 2;
    
    if (animation_end() && (sprite_index == spr_player1_grabspinnyland || sprite_index == sprites.mach3jump || sprite_index == sprites.mach3hit || sprite_index == sprites.rollgetup))
    {
        image_index = 0;
        sprite_index = sprites.mach3;
    }
    
    if (movespeed >= 16 && sprite_index != sprites.crazyrun && sprite_index != sprites.buzzsawCancel)
    {
        sprite_index = sprites.crazyrun;
        flash = true;
    }
    
    /*if (character == UnknownEnum.Value_2)
        mach4mode = movespeed >= 22;
    else*/
        mach4mode = movespeed >= 16;
    
    if (movespeed < 18)
        slope_momentum(0.1);
    
    if (sprite_index == sprites.crazyrun)
    {
        buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
        
        if (buffers.afterimageBlur == 0)
        {
            buffers.afterimageBlur = 3;
            create_blur_effect(sprite_index, image_index, x, y, xscale);
        }
        
        buffers.step--;
        
        if (buffers.step <= 0)
        {
            buffers.step = 5;
            create_particleStatic(spr_flamecloud, x, y, 1, 1);
        }
    }
    
    if (sprite_index == spr_player3_longjump && animation_end())
    {
        image_index = 0;
        image_index = image_number - 1;
    }
    
    if (grounded && (sprite_index == spr_player3_longjump || sprite_index == sprites.superjumpcancel || sprite_index == sprites.buzzsawCancel))
    {
        flash = true;
        image_index = 0;
        sprite_index = sprites.mach3;
    }
    
    if (jumpstop == false && !global.pky_jump && vsp < grav)
    {
        jumpstop = true;
        vsp /= 20;
    }
    
    if (jumpBuffer && coyote_time && sprite_index != sprites.mach3turn)
    {
        grounded = false;
        jumpBuffer = false;
        create_particleStatic(spr_grabcloud, x, y, xscale, 1);
        image_index = 0;
        sprite_index = sprites.mach3jump;
        vsp = -12;
        jumpstop = false;
        plrsnds_play(sfx.jump, x, y);
    }
    
    buffers.afterimageMach = approach(buffers.afterimageMach, 0, 1);
    
    if (buffers.afterimageMach <= 0)
    {
        buffers.afterimageMach = 6;
        create_machEffect(sprite_index, image_index, x, y, xscale);
    }
    
    if (move != xscale && move != 0 && (character == UnknownEnum.Value_6 || grounded))
    {
        plrsnds_play(sfx.machturn, x, y);
        movespeed = 12;
        sprite_index = sprites.mach3turn;
        image_index = 0;
        state = global.states.machturn;
        exit;
    }
    
    if ((((global.pky_up && global.dirGround) || (global.pky_superjump && !global.dirGround)) && grounded) && !place_meeting(x, y - 32, obj_solid))
    {
        movespeed = 12;
        image_index = 0;
        sprite_index = sprites.superjumpprepstart;
        state = global.states.superjumpprep;
        exit;
    }
    
    if (!global.pky_run && grounded)
    {
        plrsnds_play(sfx.machend, x, y);
        state = global.states.machslide;
        sprite_index = sprites.machslidestart;
        image_index = 0;
        exit;
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x, y + 1, obj_slope) && grounded && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_secretmetalblock))
    {
        plrsnds_play(sfx.slam, x, y);
        state = global.states.hitwall;
        shake_camera(15);
        sprite_index = spr_player_mach3hitwall;
        image_index = 0;
        vsp = -6;
        movespeed = -6;
    }
    
    if (((place_meeting(x + sign(hsp), y, obj_solid) && !grounded) || (scr_slope(x, y + 4) && place_meeting(x + sign(hsp), y - 4, obj_solid))) && !place_meeting(x + hsp, y, obj_metalblock) && !place_meeting(x + hsp, y, obj_secretmetalblock))
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
            exit;
        }
    }
    
    if (global.pky_down)
    {
        image_index = 0;
        sprite_index = sprites.rollstart;
        state = global.states.tumble;
        create_particleStatic(spr_grabcloud, x, y, xscale, 1);
        exit;
    }
    
    if (jumpBuffer > 8 && !grounded && (global.modded_machdoublejump || character = 12) && (isMildred || character == UnknownEnum.Value_2 || character == UnknownEnum.Value_12))
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
    else if (character == UnknownEnum.Value_4)
    {
        if (jumpBuffer > 8 && !grounded)
        {
            vsp = 20;
            sprite_index = spr_player0_goingdown;
            state = global.states.crashoutbounce;
        }
    }
    
    doTaunt();
    doGrab();
}
