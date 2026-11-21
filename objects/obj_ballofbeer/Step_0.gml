with (obj_player)
{
    if (place_meeting(x, y + 10, other) && other.dir == 1 && (global.pky_down || state == global.states.groundpound) && state != global.states.enterdoor)
    {
        targetRoom = other.targetRoom;
        door = other.targetDoor;
        hallway = false;
        movespeed = 0;
        vsp = 0;
        hsp = 0;
        x = other.x + 32;
        y = other.y;
        sprite_index = spr_player_downbox;
        image_index = 0;
        state = global.states.enterdoor;
        FMODevent_oneshot("event:/Sfx/General/Level/Progression/downbeer", x, y);
    }
    
    if (place_meeting(x, y - 10, other) && other.dir == -1 && (global.pky_up || state == global.states.superjump) && state != global.states.enterdoor)
    {
        targetRoom = other.targetRoom;
        door = other.targetDoor;
        hallway = false;
        movespeed = 0;
        vsp = 0;
        hsp = 0;
        x = other.x + 32;
        y = other.y - 20;
        sprite_index = spr_player_upbox;
        image_index = 0;
        state = global.states.enterdoor;
        FMODevent_oneshot("event:/Sfx/General/Level/Progression/downbeer", x, y);
    }
}
