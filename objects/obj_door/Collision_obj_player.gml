if obj_player.character != 11
{
if (is_transfo_all(other.state))
    exit;
}
if (other.grounded && global.pky_up && other.state != global.states.enterdoor && other.state != global.states.walkfront && other.state != global.states.snowball)
{
    with (other)
    {
        targetRoom = other.targetRoom;
        door = other.targetDoor;
        hallway = false;
        movespeed = 0;
        vsp = 0;
        hsp = 0;
        state = global.states.enterdoor;
        sprite_index = sprites.lookdoor;
        image_index = 0;
    }
}
