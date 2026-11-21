if (global.escapeLap == 3)
{
    event_user(0);
    exit;
}
if variable_global_exists("bossroom") && global.bossroom
{
	game_end()
	exit;
	
}
with (obj_player)
{
    generalReset();
    movespeed = 0;
    vsp = 0;
    hsp = 0;
    state = global.states.enterdoor;
    door = "NONE";
    room_goto(backtohubRoom);
    
    if (instance_exists(obj_backtohub))
        instance_destroy(obj_backtohub);
    
    instance_create(x, y, obj_backtohub);
}

global.level = -4;
global.resetRoom = -4;
