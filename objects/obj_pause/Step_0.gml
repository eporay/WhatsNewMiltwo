if (instance_exists(obj_option))
    exit;
var _resume = 
{
    option: "pause_resume",
    icon: new addPause_icon(0),
	
    func: function()
    {
        with (obj_pause)
            doUnpause();
    }
};
var _restart = 
{
    option: "pause_restart",
    icon: new addPause_icon(2),
    func: function()
    {
        with (obj_pause)
        {
            if (global.resetRoom != -4)
            {
                var _og = global.resetRoom;
                var _og2 = global.level;
                
                if (instance_exists(obj_backtohub))
                    instance_destroy(obj_backtohub);
                
                doUnpause();
                
                with (obj_music)
                {
                    stop_music(true, true);
                    
                    if (FMODevent_isplaying(escapeInst))
                        fmod_studio_event_instance_stop(escapeInst, UnknownEnum.Value_1);
                }
                
                with (obj_player)
                {
                    door = "A";
                    movespeed = 0;
                    vsp = 0;
                    hsp = 0;
                    state = global.states.enterdoor;
                }
                
                room_goto(_og);
                generalReset();
                global.resetRoom = _og;
                global.level = _og2;
            }
        }
    }
};
var _option = 
{
    option: "pause_options",
    icon: new addPause_icon(1),
    func: function()
    {
        FMODevent_oneshot("event:/Sfx/UI/Pause/menuselect");
        instance_create(0, 0, obj_option);
    }
};
var _exitlevel = 
{
    option: global.level = -4 ? "pause_menu" : "pause_exit",
    icon: new addPause_icon(3),
    func: function()
    {
        with (obj_pause)
        {
            doUnpause();
            		unload_textures(global.level_loaded_pages)
            if (instance_exists(obj_backtohub))
                instance_destroy(obj_backtohub);
            
            with (obj_player)
            {
                if (global.level == -4)
                {
                    with (obj_music)
                        stop_music();
                    
                    generalReset();
                    movespeed = 0;
                    vsp = 0;
                    hsp = 0;
                    state = -4;
                    door = "A";
                    room_goto(Mainmenu);
                }
                else
                {
                    with (obj_music)
                        stop_music();
                    
                    generalReset();
                    movespeed = 0;
                    vsp = 0;
                    hsp = 0;
                    state = -4;
                    door = "NONE";
                    room_goto(backtohubRoom);
                    instance_create(x, y, obj_backtohub);
                    global.level = -4;
                    global.resetRoom = -4;
                }
            }
        }
    }
};
activelrp = lerp(activelrp, active, 0.1);
activelrp = approach(activelrp, active, 0.001);
var _nopauseRooms = room == timesup_room || room = boss_bacon || room == Mainmenu || instance_exists(obj_fadeout) || instance_exists(obj_rank) || instance_exists(obj_technicaldifficulty) || instance_exists(obj_titlecard) || obj_shell.isOpen;

if (!active && global.pky_start2 && !_nopauseRooms && buffer == 0)
{
		options = []

array_push(options, _resume);
array_push(options, _option);
if global.level != -4
array_push(options, _restart);
array_push(options, _exitlevel);
	_resume.offsetX = 960;
_option.offsetX = 960;
_restart.offsetX = 960;
_exitlevel.offsetX = 960;
if global.twistedpause
{
			ttwob = true
		ttwob_buf = 0
		ttwob_hsp = 0
		ttwob_cursor_x = 1080
		ttwob_cursor_y = -128
		ttwob_circless = []
		ttwob_activeOld = false
		ttwob_pausealpha = array_create(array_length(options), 0)
		ttwob_pausealpha[selected] = 1
}
    doPause();
}
else if (active && !instance_exists(obj_option) && buffer == 0)
{
	/*if keyboard_check_pressed(vk_f6)
	{
		global.twistedpause = !global.twistedpause
	}*/
    graphBack.alpha = approach(graphBack.alpha, 0.55, 0.01);
    var move = global.mky_down2 - global.mky_up2;
    
    if (move != 0)
        selected += move;
    
    selected = clamp(selected, 0, array_length(options) - 1);
    
    if (global.mky_slap2 || global.pky_start2)
        doUnpause();
    
    if (global.mky_jump2)
        options[selected].func();
    
    var _pos = fmod_studio_event_instance_get_timeline_position(pauseMusic) * 0.01;
}

buffer = approach(buffer, 0, 1);
if global.twistedpause = 2 && newwsb
{
for (var i = 0; i < array_length(backgroundhearts); i++)
{
    var q = backgroundhearts[i];
    q.y -= 0.5;
    q.image_index += q.image_speed;
    var _delete = q.y < ((obj_screensizer.displayHeight / 2) - 32);
    
    if (_delete)
        q.image_alpha -= 0.01;
    else
        q.image_alpha = approach(q.image_alpha, 1, 0.05);
    
    if (!active)
    {
        _delete = true;
        q.image_alpha -= 0.1;
    }
    
    if (_delete && q.image_alpha <= 0)
    {
        q = undefined;
        array_delete(backgroundhearts, i, 1);
        i--;
    }
}
}