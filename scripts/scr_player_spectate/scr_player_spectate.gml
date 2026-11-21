function scr_player_spectate()
{
	
if !instance_exists(spectateID) || (global.pky_jump2 && !scr_solid(x, y)) || global.racemode.active || global.prophuntmode.active 
{
					            vsp = -9;
								
            state = global.states.jump;
            sprite_index = spr_player_spinout;
				image_alpha = 1
			visible = 1
			spectateID = -4
			with (obj_camera)
state = global.states.normal;
	exit;
}
    hsp = 0;
	movespeed = 0
    vsp = 0;
	            xscaleMulti = 1;
            yscaleMulti = 1;
			squashX = 1
			squashY = 1
			visible = 1
			image_speed =0.35
    sprite_index = scr_solid(x, y) ? sprites.spectate : spr_player_bumpenemy

x =  spectateID.xlerp
y = spectateID.ylerp - 80
if room != spectateID.currentRoom
{
	room_goto(spectateID.currentRoom)
}
with (obj_camera)
{

		camera.x = other.spectateID.xlerp

        var _t = camera.zoom;
        _t = _t * _t;
        camera.y = other.spectateID.ylerp - (50 * _t)
	state = -6
}
}
