with (instance_place(x, y - 1, obj_player))
{
    if (global.pky_up && global.pky_down)
        exit;
    
    if ((global.pky_up && place_meeting(x, y, obj_ladder)) || ((global.pky_down && grounded && place_meeting(x, y + 1, obj_ladder) && !place_meeting(x, y + 1, obj_solid)) && (state == global.states.normal || state == global.states.jump || state == global.states.freefallland || state == global.states.crouch || state == global.states.tumble)))
    {
        state = global.states.ladder;
        hsp = 0;
        movespeed = 0;
        
        if (global.pky_down && grounded && !global.pky_up)
        {
            repeat (32)
            {
                if (!place_meeting(x, y, obj_ladder))
                    y++;
            }
        }
    }
}
