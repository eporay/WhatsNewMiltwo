function scr_player_skateboardIntro()
{
    hsp = 0;
    vsp = 0;
    image_speed = 0.35;
    
    if (animation_end())
    {
        sprite_index = spr_player_skate_idle;
        state = global.states.skateboard;
        prevOnSlope = false;
        onSlope = false;
        slopeObj = -4;
        wasRamp = false;
        sprayCans = 4;
        
        if (!instance_exists(obj_skateboardViewer))
            instance_create(0, 0, obj_skateboardViewer);
    }
}

function scr_player_skateboardAim()
{
    sprite_index = sprites.fall;
    image_speed = 0.35;
    vsp = verticalMovespeed;
    hsp = movespeed;
    movespeed = lerp(movespeed, 0, 0.15);
    verticalMovespeed = lerp(verticalMovespeed, 0, 0.15);
    
    if ((hsp == 0 && vsp == 0) || !global.pky_grab)
    {
        FMODevent_oneshot("event:/Sfx/Player/Transformations/Skateboard/release", x, y);
        var move = global.pky_right + global.pky_left;
        
        if (move != 0)
            xscale = move;
        if global.pky_down && character = 11
		{
			if move = 0
			{
			if move != 0
			xscale = move
			            movespeed = 8 * move;
						hsp = movespeed
            vsp = 5;
            sprite_index = spr_player_skate_rampjump;
            image_index = 0;
            state = global.states.groundpound;
			}
			else
			{
				            movespeed = 16;
            vsp = 10;
            sprite_index = spr_player_skate_rampjump;
            image_index = 0;
            state = global.states.skateboardramp;
			}
		}
       else if (!global.pky_up)
        {
            movespeed = 16;
            vsp = -8;
            sprite_index = spr_player_skate_rampjump;
            image_index = 0;
            state = global.states.skateboardramp;
        }
        else if (move == 0)
        {
            movespeed = 0;
            hsp = 0;
            vsp = -20;
            state = global.states.skateboardwall;
            movespeed = 0;
            sprite_index = spr_playerN_knightdoublejump;
        }
        else
        {
            vsp = -20;
            movespeed = 16;
            sprite_index = spr_player_skate_rampjump;
            image_index = 0;
            state = global.states.skateboardramp;
        }
        
        create_particleStatic(spr_crazyrunothereffect, x, y, xscale, 1).image_speed = 0.5;
    }
}

function scr_player_skateboardwall()
{
    image_speed = 0.35;
        if character = 11
	doTaunt()
    if (grounded)
    {
        sprite_index = spr_player_skate_idle;
        state = character = 11 ? global.states.normal : global.states.skateboard;
    }
    
    if (global.pky_grab2 && sprayCans >= 1)
    {
        sprayCans--;
        state = global.states.skateboardAim;
        verticalMovespeed = vsp;
        movespeed = hsp;
    }
    
    if (grounded)
        sprayCans = 4;
}

function scr_player_skateboardhitwall()
{
    image_speed = 0.35;
    hsp = movespeed * xscale;
    
    if (grounded)
        movespeed = approach(movespeed, 0, 0.5);
    
    if (movespeed == 0)
    {
        sprite_index = spr_player_skate_idle;
        image_index = 0;
        state = character = 11 ? global.states.normal : global.states.skateboard
    }
    
    if (grounded)
        sprayCans = 4;
}

function scr_player_skateboardramp()
{
	    if character = 11
	doTaunt()
    hsp = movespeed * xscale;
    movespeed = approach(movespeed, 13, 1);
    image_speed = 0.4;
    
    if (grounded)
    {
        sprite_index = spr_player_skate_walk;
        image_index = 0;
        state = global.states.skateboardmove;
    }
    
    if (grounded)
        sprayCans = 4;
    
    buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
    
    if (buffers.afterimageBlur == 0)
    {
        buffers.afterimageBlur = 3;
        create_blur_effect(sprite_index, image_index, x, y, xscale);
    }
    
    if (global.pky_grab2 && sprayCans >= 1)
    {
        sprayCans--;
        state = global.states.skateboardAim;
        verticalMovespeed = vsp;
        movespeed = hsp;
    }
    
    if (global.pky_down2)
        vsp = 12;
}

function scr_player_skateboardmove()
{
    hsp = movespeed * xscale;
    image_speed = 0.4;
    if character = 11
	{
		    if (global.pky_down)
    {
        image_index = 0;
        sprite_index = sprites.rollstart;
        state = global.states.tumble;
        create_particleStatic(spr_grabcloud, x, y, xscale, 1);
        exit;
    }
	if animation_end() && sprite_index = sprites.rollgetup
	        sprite_index = spr_player_skate_walk;
	doTaunt()
	}
    if (grounded)
        sprayCans = 4;
    
    buffers.dashcloud--;
    
    if (buffers.dashcloud <= 0 && grounded)
    {
        buffers.dashcloud = 12;
        create_particleStatic(spr_dashcloud1, x, y, xscale, 1);
    }
    
    if (jumpstop == false && !global.pky_jump && vsp < grav)
    {
        jumpstop = true;
        vsp /= 20;
    }
    
    slope_momentum(0.25);
    
    if (jumpBuffer > 5 && grounded)
    {
        jumpBuffer = false;
        jumpStop = false;
        image_index = 0;
        sprite_index = spr_player_skate_jump;
        vsp = -10;
        FMODevent_oneshot("event:/Sfx/Player/Transformations/Skateboard/jump", x, y);
    }
    
    if (animation_end() && sprite_index == spr_player_skate_jump)
        sprite_index = spr_player_skate_walk;
    
    prevOnSlope = scr_slope(x, y + 1);
    
    if (prevOnSlope == true)
    {
        slopeObj = instance_place(x, y + 1, obj_slope);
        
        if (sign(slopeObj.image_xscale) == xscale)
            wasRamp = true;
        else
            wasRamp = false;
    }
    
    if (onSlope != prevOnSlope)
    {
        if (onSlope == true && prevOnSlope == false && wasRamp)
        {
            onSlope = prevOnSlope;
            vsp = -12;
            movespeed = 13;
            sprite_index = spr_player_skate_rampjump;
            image_index = 0;
            state = global.states.skateboardramp;
            FMODevent_oneshot("event:/Sfx/Player/Transformations/Skateboard/ramp", x, y);
            exit;
        }
        else
        {
            onSlope = prevOnSlope;
        }
    }
    
    if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_stupidcabbit))
    {
        var _hitwall = doBump(40, abs(hsp) + 1);
        
        if (_hitwall)
        {
            vsp = -6;
            movespeed = -6;
            sprite_index = spr_player_skate_stun;
            image_index = 0;
            state = global.states.skateboardhitwall;
            FMODevent_oneshot("event:/Sfx/Player/Transformations/Skateboard/bump", x, y);
            exit;
        }
    }
    
    if (global.pky_grab2 && sprayCans >= 1)
    {
        sprayCans--;
        state = global.states.skateboardAim;
        verticalMovespeed = vsp;
        movespeed = hsp;
    }
}

function scr_player_skateboard()
{
    hsp = movespeed * xscale;
    var move = global.pky_right + global.pky_left;
    image_speed = 0.4;
    
    if (grounded)
        sprayCans = 4;
    
    if (global.pky_grab && sprayCans >= 1)
    {
        sprayCans--;
        state = global.states.skateboardAim;
        verticalMovespeed = vsp;
        movespeed = -3 * move;
    }
	if character = 11
	{
		if move != 0
		{
			if sprite_index != spr_player_skate_jump
			sprite_index = spr_player_skate_walk
			if movespeed < 7
			movespeed = approach(movespeed, 7, 0.5)
			xscale = move
		}
		else
		{
			movespeed = 0
			if sprite_index != spr_player_skate_jump
		sprite_index = spr_player_skate_idle
		}
		if animation_end() && sprite_index = spr_player_skate_jump
		sprite_index = spr_player_skate_walk
		if jumpBuffer > 0 && coyote_time
		{
			jumpBuffer = 0
			jumpstop = 0

			sprite_index = spr_player_skate_jump
			        vsp = -10;
        FMODevent_oneshot("event:/Sfx/Player/Transformations/Skateboard/jump", x, y);
		}
		    if (jumpstop == false && !global.pky_jump && vsp < grav)
    {
        jumpstop = true;
        vsp /= 20;
    }
        slope_momentum(0.25);
		doTaunt()
	}
}
