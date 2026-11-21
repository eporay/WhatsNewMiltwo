if (other.grounded && global.pky_up && other.state != global.states.enterdoor && other.state != global.states.walkfront && other.state != global.states.snowball)
{
    entering = true;
    
    with (other)
    {
        targetRoom = other.targetRoom;
        door = other.targetDoor;
        hallway = false;
        movespeed = 0;
        vsp = 0;
        hsp = 0;
        state = global.states.enterdoor;
        sprite_index = sprites.entergate;
        image_index = 0;
        
        with (obj_music)
            stop_music();
    }
}
