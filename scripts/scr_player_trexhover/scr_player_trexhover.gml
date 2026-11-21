function scr_player_trexhover()
{
    var move = global.pky_left + global.pky_right;
	image_speed = 0.35
            if (slapBuffer > 0 && !grounded)
{
                    state = global.states.mach2;
            image_index = 0;
            sprite_index = sprites.groundpoundcancel;
            

            
            movespeed = abs(movespeed);
			if movespeed < 13
			movespeed = 13
vsp = -6
slapBuffer = 0
jumpstop = 1
            FMODevent_oneshot("event:/Sfx/Player/airspin", x, y);
        exit;
		
		
    }

        if (jumpstop == false && !global.pky_jump && vsp < grav)
    {
        jumpstop = true;
        vsp /= 20;
    }

    hsp = movespeed;
	if vsp > 5 && (sprite_index = spr_trex_hatglidestart || sprite_index = spr_trex_hatglide) && vsp < 15
	vsp = approach(vsp, 5, grav * 2)
	if global.pky_down2 && vsp < 15
	vsp = 15
	if animation_end() && sprite_index = spr_trex_hatglidestart
	sprite_index = spr_trex_hatglide
		if animation_end() && sprite_index = spr_trex_hatglidestop
	image_index = image_number - 1
	/*if sprite_index = spr_trex_hatglidestart && image_index = 0
	{
        FMODevent_oneshot("event:/Sfx/Player/airspin", x, y);
		            
            with (create_particleStatic(spr_crazyrunothereffect, x, y, 1, 1))
            {
                image_angle = 90;
                image_speed = 0.5;
            }
	}*/
	if !global.pky_jump && (sprite_index = spr_trex_hatglidestart || sprite_index = spr_trex_hatglide)
	{
		sprite_index = spr_trex_hatglidestop
		image_index = 0
movespeed = abs(movespeed)
if movespeed < 12
movespeed = 12
movespeed *= move
	}
	if global.pky_down && sprite_index = spr_trex_hatglidestop
	vsp += 0.5
if (grounded && vsp >= 0)
    {
        movespeed = abs(movespeed);
        
        if (move != 0)
            xscale = move;
        
        if (global.pky_run)
        {
			movespeed = hsp * xscale
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
    if move != 0
	{
		if abs(movespeed) < 12
		movespeed = approach(movespeed, move * 12, 0.6);
		else
		movespeed = approach(movespeed, move * abs(movespeed), 0.6);
		xscale = move
	}
else
movespeed = approach(movespeed, 0, 0.6);
    doTaunt();
}
