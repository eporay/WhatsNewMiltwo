function scr_player_freefallland()
{
    image_speed = 0.35;
    vsp = 0;
    hsp = 0;
    movespeed = 0;
    
    if (animation_end())
    {
        if (sprite_index == spr_player_hitceiling)
        {
            state = global.states.jump;
            sprite_index = spr_player_spinout;
            vsp = 2;
        }
        if sprite_index = spr_skatenic_crusherland
		{
			/*if global.pky_jump
			{
            verticalMovespeed = -12;
            movespeed = 12
			    var move = global.pky_right + global.pky_left;
			hsp = movespeed * move
            grounded = false;
            scale = 1.35;
            state = global.states.climbwall;
			plrsnds_play(sfx_skatenic_bounce, x, y);
            sprite_index = sprites.wallclimb;
			}
			else
			{*/
				            state = global.states.normal;
            image_index = 0;
            sprite_index = sprites.land;
			//}
		}
        if (sprite_index == sprites.groundpoundland || sprite_index == sprites.divebombland )
        {
            state = global.states.normal;
            image_index = 0;
            sprite_index = sprites.land;
        }
        
        if (sprite_index == spr_player_piledriverend)
        {
            state = global.states.jump;
            vsp = -8;
            image_index = 0;
            sprite_index = sprites.fall;
        }
    }
}
