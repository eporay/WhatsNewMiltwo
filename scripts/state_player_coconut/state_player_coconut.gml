function scr_player_coconut_intro()
{
    image_speed = 0.35;
    hsp = 0;
    vsp = 0;
    
    if (animation_end())
    {
        sprite_index = spr_player_coconut_idle;
        image_index = 0;
        state = global.states.coconut_gun;
        movespeed = 0;
        hsp = 0;
    }
}

function scr_player_coconut_gun()
{
	if  character = chars.milton
	{
		scr_player_coconut_gunREMASTER()
	exit;
	}
    hsp = approach(hsp, movespeed * xscale, 0.5);
    var move = global.pky_right + global.pky_left;
    
    if (jumpstop == false && !global.pky_jump && vsp < grav)
    {
        jumpstop = true;
        vsp /= 20;
    }
    
    if (move != 0)
    {
        image_speed = movespeed / 15;
        xscale = move;
        movespeed = 9;
        
        if (grounded)
            sprite_index = spr_player_coconut_walk;
			if place_meeting(x + xscale, y, obj_solid)
			image_speed =0.1
    }
    else
    {
        image_speed = 0.35;
        movespeed = 0;
        
        if (grounded)
            sprite_index = spr_player_coconut_idle;
    }
    
    /*if (place_meeting(x + xscale, y, obj_solid) && !scr_slope(x, y + 1))
    {
        movespeed = -8;
        hsp = movespeed * xscale;
        vsp -= 4;
        jumpstop = true;
    }*/
    
    if (animation_end() && sprite_index == spr_player_coconut_jump)
        sprite_index = spr_player_coconut_fall;
    
    if (jumpBuffer && coyote_time && grounded)
    {
        jumpBuffer = false;
        create_particleStatic(spr_jumpeffect, x, y, 1, 1);
        image_index = 0;
        sprite_index = spr_player_coconut_jump;
        vsp = -14;
        jumpstop = false;
        plrsnds_play(sfx.jump, x, y);
    }
    
    if (global.pky_grab2)
    {
		if global.pky_down
		{
			 sprite_index = spr_player_coconut_shoot;
        image_index = 0;
        state = global.states.coconut_shoot;
        movespeed = -8;
        vsp = -10;
        

        
        with (instance_create(x , y + 4, obj_coconut_bomb))
        {
            xscale = other.xscale;

                vsp = 16;
				if move = 0
                movespeed = 0;
            
        }
		}
		else
		{
        sprite_index = spr_player_coconut_shoot;
        image_index = 0;
        state = global.states.coconut_shoot;
        movespeed = -8;
        vsp = -vsp * 0.5;
        
        if (round(vsp) == 0)
            vsp = -4;
                    if (global.pky_up)
            {
				vsp = 10
				movespeed = 0
			}
        with (instance_create(x + (4 * xscale), y - 4, obj_coconut_bomb))
        {
            xscale = other.xscale;
            vsp = -4;
            
            if (global.pky_up)
            {
                vsp = -16;
				if move = 0
                movespeed = 0;
            }
        }
		}
    }
}

function scr_player_coconut_shoot()
{
	 if character = chars.milton
	 {
	scr_player_coconut_shootREMASTER()
	exit;
	 }
    image_speed = 0.5;
    hsp = movespeed * xscale;
    movespeed = approach(movespeed, 0, 0.25);
    
    if (animation_end())
    {
        sprite_index = spr_player_coconut_idle;
        image_index = 0;
        state = global.states.coconut_gun;
        movespeed = 0;
    }
}
function scr_player_coconut_gunREMASTER()
{
    hsp = approach(hsp, movespeed * xscale, 0.5);
    var move = global.pky_right + global.pky_left;
    
    if (jumpstop == false && !global.pky_jump && vsp < grav)
    {
        jumpstop = true;
        vsp /= 20;
    }
    
    if (move != 0)
    {
        image_speed = movespeed / 15;
        xscale = move;
        movespeed = 9;
        
        if (grounded)
            sprite_index = spr_player_coconut_walk;
			if place_meeting(x + xscale, y, obj_solid)
			image_speed =0.1
    }
    else
    {
        image_speed = 0.35;
        movespeed = 0;
        
        if (grounded)
            sprite_index = spr_player_coconut_idle;
    }
    
    /*if (place_meeting(x + xscale, y, obj_solid) && !scr_slope(x, y + 1))
    {
        movespeed = -8;
        hsp = movespeed * xscale;
        vsp -= 4;
        jumpstop = true;
    }*/
    
    if (animation_end() && sprite_index == spr_player_coconut_jump)
        sprite_index = spr_player_coconut_fall;
    
    if (jumpBuffer && coyote_time && grounded)
    {
        jumpBuffer = false;
        create_particleStatic(spr_jumpeffect, x, y, 1, 1);
        image_index = 0;
        sprite_index = spr_player_coconut_jump;
        vsp = -14;
        jumpstop = false;
        plrsnds_play(sfx.jump, x, y);
    }
    
    if (global.pky_grab2)
    {
		image_index = 0
		state = global.states.coconut_shoot
		sprite_index = spr_player_superjumpcancelstart
    }
}
function scr_player_coconut_shootREMASTER()
{
	vsp = 0
	    var move = global.pky_right + global.pky_left;
		if move != 0
		xscale = move
    image_speed = 0.5;
    hsp = movespeed * xscale;
    movespeed = 0
    
    if (animation_end())
    {
		if global.pky_up
		{
			verticalMovespeed = -8
			if move != 0
			movespeed = 8 else 
			movespeed = 0
		}
			else if global.pky_down
		{
			verticalMovespeed = 8
			if move != 0
			movespeed = 8 else 
			movespeed = 0
		}
		else
		{
			verticalMovespeed = 0
			movespeed = 8 
		}
        sprite_index = spr_player_spinout;
        image_index = 0;
        state = global.states.coconut_float;

    }
}
function scr_player_coconut_float()
{
	        buffers.afterimageMach = approach(buffers.afterimageMach, 0, 1);
        
        if (buffers.afterimageMach == 0)
        {
            buffers.afterimageMach = 4;
            create_machEffect(sprite_index, image_index, x, y, xscale, 1);
        }
        
        buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
        
        if (buffers.afterimageBlur == 0)
        {
            buffers.afterimageBlur = 3;
            create_blur_effect(sprite_index, image_index, x, y, xscale);
        }
    image_speed = 0.5;
    hsp = movespeed * xscale;
    vsp = verticalMovespeed

    if movespeed < 18 && movespeed > 0
	movespeed += grav
	
	if verticalMovespeed > 0 && verticalMovespeed < 18
	verticalMovespeed += grav
	else 	if verticalMovespeed < 0 && verticalMovespeed > -18
	verticalMovespeed -= grav
	instance_destroy(instance_place(x + sign(hsp), y + sign(vsp), obj_stupidcabbit))
if scr_solid(x + sign(hsp), y + sign(vsp)) && !place_meeting(x + sign(hsp), y + sign(vsp), obj_destructibles) && !place_meeting(x + sign(hsp), y + sign(vsp), obj_stupidcabbit)
{
 var isy = scr_solid(x, y + sign(vsp))
  var isx = scr_solid(x+ sign(hsp) , y )
             create_particleStatic(spr_bangeffect, x, y, 1);

            FMODevent_oneshot("event:/Sfx/Player/slipbump", x, y);
			        jumpstop = true;
  if isx 
  hsp *= -1
  if isy
  vsp *= -1
  sprite_index = spr_player_buzzsaw
	state = global.states.coconut_gun
}
}
function scr_player_jarona()
{
	vsp = 0
	    var move = global.pky_right + global.pky_left;
		if move != 0
		xscale = move
    image_speed = 0.5;
    hsp = movespeed * xscale;
    movespeed = 0
    
    if (animation_end())
    {
		if global.pky_up
		{
			verticalMovespeed = -8
			if move != 0
			movespeed = 8 else 
			movespeed = 0
		}
			else if global.pky_down
		{
			verticalMovespeed = 8
			if move != 0
			movespeed = 8 else 
			movespeed = 0
		}
		else
		{
			verticalMovespeed = 0
			movespeed = 8 
		}
        sprite_index = spr_player_longjump;
        image_index = 0;
		
        state = global.states.jaronalaunch;
flash = 1
    }
}
function scr_player_jaronalaunch()
{
	        buffers.afterimageMach = approach(buffers.afterimageMach, 0, 1);
        
        if (buffers.afterimageMach == 0)
        {
            buffers.afterimageMach = 4;
            create_miltonAfterimage(sprite_index, image_index, x, y, xscale, 1);
        }
        	    var move = global.pky_right + global.pky_left;
if animation_end() && sprite_index = spr_player_longjump
sprite_index = spr_player_longjumpend
    image_speed = 0.5;
    hsp = movespeed * xscale;
    vsp = verticalMovespeed
    
    if (!instance_exists(chargeeffect))
        chargeeffect = instance_create(x, y, obj_chargeeffect);
    if movespeed < 18 && movespeed > 0
	movespeed += grav
	
	if verticalMovespeed > 0 && verticalMovespeed < 18
	verticalMovespeed += grav
	else 	if verticalMovespeed < 0 && verticalMovespeed > -18
	verticalMovespeed -= grav
	instance_destroy(instance_place(x + sign(hsp), y + sign(vsp), obj_stupidcabbit))
	if !scr_slope(x, y + 1)
	{
if scr_solid(x + sign(hsp), y + sign(vsp)) && !place_meeting(x + sign(hsp), y + sign(vsp), obj_destructibles) && !place_meeting(x + sign(hsp), y + sign(vsp), obj_stupidcabbit)
{
 var isy = scr_solid(x, y + sign(vsp))
  var isx = scr_solid(x+ sign(hsp) , y )
             create_particleStatic(spr_bangeffect, x, y, 1);

            FMODevent_oneshot("event:/Sfx/Player/slipbump", x, y);
			        jumpstop = true;
  if isx 
  xscale *= -1
  if isy
  verticalMovespeed *= -1

}
	}
	else if vsp > 0
	{
	if place_meeting(x + sign(hsp), y + sign(vsp), obj_solid) || (place_meeting(x + sign(hsp), y + sign(vsp), obj_platform) && vsp > 0) || scr_slope(x, y + 1)
	{
		verticalMovespeed = 0
		var slope = instance_place(x, y + 1, obj_slope);
            xscale = -sign(slope.image_xscale);
			if movespeed = 0
			movespeed = 8
	}
	}
    if (jumpBuffer)
    {
		if move != 0
		xscale = move
        jumpBuffer = false;
        image_index = 0;
        sprite_index = sprites.longjump;
        state = global.states.mach2;
        vsp = -12;
        jumpstop = false;
        plrsnds_play(sfx.rollgetup, x, y);
        create_particleStatic(spr_grabcloud, x, y, xscale, 1);
    }
	doGrab()
}