		var instance = id
with (obj_player)
{
	if place_meeting(x, y, other) && global.pky_up2 && !instance_exists(obj_onlineLevelSelect)
	{

		hsp = 0
		movespeed =0
		sprite_index = sprites.idle 
		state = -4
		    with (instance_create(0, 0, obj_onlineLevelSelect))
    {
        text = "Select a level to remove best time on";
        
        selectfunc = function(arg0, arg1)
        {
xdata_open(global.saveFile);

 xdata_write(arg1, "PersonalBest", 0);
 xdata_write(arg1, "TimeSet", 0);
xdata_close()
obj_player.state = global.states.normal
        FMODevent_oneshot("event:/Sfx/Player/hurt", obj_player.x, obj_player.y);
		scr_transfotip("[shake]Removed times on selected level.")
		obj_levelremovetimes.shake += 3
        };
    }
	}
}
x = xstart + irandom_range(shake, -shake)
shake = approach(shake, 0, 0.1)