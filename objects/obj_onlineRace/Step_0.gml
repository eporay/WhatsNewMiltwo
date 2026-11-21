obj_pause.buffer = 1000;

with (obj_player)
{
    if (global.racemode.timer >= 4)
    {
        state = -6;
		visible = 0
        hsp = 0;
        vsp = 0;
        movespeed = 0;
    }
    else if (state == -6)
    {
        state = global.states.walkfront;
		                sprite_index = sprites.walkfront;
                image_index = 0;
visible = 1
    }
}
