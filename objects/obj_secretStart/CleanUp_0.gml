if (cutscene)
{
    with (obj_player)
    {
        jumpstop = true;
        vsp = 10;
        state = global.states.groundpound;
        sprite_index = sprites.groundpound;
        xscaleMulti = 1;
        yscaleMulti = 1;
        roomstartX = x;
        roomstartY = y;
					if global.modded_oldsecreteye 
			{
				            vsp = -9;
            state = global.states.jump;
            sprite_index = spr_player_spinout;
			}
    }
}
