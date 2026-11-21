obj_player.state = -4;
var c = [0, 0, 1773835, 4070972, 668792, 2822774, 2634857, 942110, 2646030, 1726323, 2511939, 5385018, 5516625, 6236249, 5403779, 11165784, 12813175, 9895888, 16750739];
shd1 = shader_get_uniform(shd_menunew, "u_count");
shd2 = shader_get_uniform(shd_menunew, "u_pal");
shdl = array_length(c);
shda = array_create(shdl * 3, 0);

for (var i = 0; i < shdl; i++)
{
    var q = c[i];
    shda[i * 3] = (q & 255) / 255;
    shda[(i * 3) + 1] = ((q >> 8) & 255) / 255;
    shda[(i * 3) + 2] = ((q >> 16) & 255) / 255;
}

surf = -4;
state = "files";
drawsurf = -4;
tv_file = "";
tv_nsbuffer = 0;
tv_static = -1;
tv_change = 0;
tv_max = 7;
tv_index = 0;
tv_indexnext = tv_index;
mousemoved = false;
mouse_xspd = 0;
mouse_yspd = 0;
mouse_xfake = 480;
mouse_yfake = 400;
light_final = random_range(-0.01, 0.01) + 0.225;
light_timer = 1;
hand_grab = -4;
hand_hover = 0;
hand_x = mouse_xfake - 150;
hand_y = mouse_yfake;
hand_x_old = hand_x;
hand_y_old = hand_y;
fadestage = -1;
fadestate = "";
file = 0;
file_txt = "";
file_select = 0;
file_selectnew = 0;
music = FMODcreate_event("event:/Music/General/mainmenu");
    fmod_studio_event_instance_start(music);
    fmod_studio_event_instance_set_paused(music, false);
	function menunew_item(arg0 = 0, arg1 = "none") constructor
{
    xdraw = 0;
    ydraw = 0;
    x = 0;
    y = 0;
    vsp = 0;
    index = arg0;
    type = arg1;
}

items = [];
var _t = new menunew_item(3, "drawer");
_t.xdraw = 0;
array_push(items, _t);
_t = new menunew_item(3, "drawer");
_t.xdraw = 300;
array_push(items, _t);
_t = new menunew_item(3, "drawer");
_t.xdraw = 600;
array_push(items, _t);
_t = new menunew_item(15, "disc");
_t.link = 0;
array_push(items, _t);
_t = new menunew_item(16, "disc");
_t.link = 1;
array_push(items, _t);
_t = new menunew_item(17, "disc");
_t.link = 2;
array_push(items, _t);