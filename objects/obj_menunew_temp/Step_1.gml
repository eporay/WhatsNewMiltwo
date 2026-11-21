if instance_exists(obj_option)
exit;
if global.pky_start2 && !start
instance_create(0, 0, obj_option)
global.halloween = current_month = 10 || (current_month = 11 && current_day <= 5)
var move = global.pky_down2 - global.pky_up2
if (global.pky_jump2 && !start)
{
    var _rm = hotel_start;
	if global.halloween
	var _rm = hotel_halloween_start;
    var _dr = "A";
    
    with (obj_player)
    {
        global.saveFile = global.wsbMOmInfo.dir + string("sandbox{0}.xda", other.save);
        xdata_open(global.saveFile);
        character = xdata_read("Modded", "c_char", UnknownEnum.Value_0);
        palIndex = xdata_read("Modded", "c_pal", 1);
        xdata_close();
        event_user(0);
        generalReset();
        targetRoom = _rm;
        door = _dr;
        movespeed = 0;
        vsp = 0;
        hsp = 0;
        state = global.states.enterdoor;
    }
    
    global.level = -4;
    global.resetRoom = _rm;
start = 1
FMODevent_oneshot("event:/Sfx/General/Collects/bigcollect", room_width / 2, room_height / 2);
obj_camera.camera.zoom = 0.5

}
obj_camera.state = -5
obj_camera.camera.zoom = lerp(obj_camera.camera.zoom, 1, 0.08);
obj_camera.camera.x = 960 / 2
obj_camera.camera.y = 540 / 2
if start 
{
	if (obj_camera.camera.zoom = 1 || global.pky_jump2) && !instance_exists(obj_fadeout)
	{

    instance_destroy(obj_fadeout);
    
scr_fadeout( 0.0175);
	}
}
if move != 0
{
	save += move
	save = clamp(save, 1, 3)
}