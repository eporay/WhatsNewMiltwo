depth = obj_screensizer.depth + 200;
active = false;
graphBorderSize = 2;
activelrp = 0;
graphBack = 
{
    alpha: 0,
    x: 0,
    y: 0
};
bacon = 
{
    index: 0,
    x: -224,
    y: 736,
    smokeIndex: 0
};
screenSprite = -4;
screenSprite2 = -4;
pauseMusic = FMODcreate_event("event:/Music/General/pause");
vinylSND = FMODcreate_event("event:/Sfx/vinyl");
selected = 0;
options = [];
hearts = [];
buffer = 0;
tipText = "";
playerPalIndex = 0;
heartFind = 1;
character = UnknownEnum.Value_0;
newwsb = 0
create_background_heart = function(arg0, arg1)
{
    var q = 
    {
        x: arg0,
        y: arg1,
        sprite_index: spr_pause_heart_fly,
        image_index: 0,
        image_speed: 0.04,
        image_alpha: 0
    };
    
    if (active)
        array_push(backgroundhearts, q);
    
    return q;
};
alarm[1] = 100;
function create_heart(arg0, arg1, arg2)
{
    var q = 
    {
        index: 0,
        sprite: arg2 ? spr_pauseHeart_full : spr_pauseHeart_empty,
        x: arg0,
        xstart: arg0,
        y: arg1,
        alpha: 0,
        fadeout: false,
        fadeoutTimer: 60
    };
    array_push(hearts, q);
}

alarm[0] = 60;
var _resume = 
{
    option: "pause_resume",
    
    func: function()
    {
        with (obj_pause)
            doUnpause();
    }
};
var _restart = 
{
    option: "pause_restart",
    
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
    
    func: function()
    {
        FMODevent_oneshot("event:/Sfx/UI/Pause/menuselect");
        instance_create(0, 0, obj_option);
    }
};
var _exitlevel = 
{
    option: "pause_exit",
    
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
addPause_icon = function(arg0) constructor
{
    index = arg0;
    alpha = 0;
};
function doPause()
{

    audio_pause_all();
    
    if (pauseMusic >= 0)
        fmod_studio_event_instance_set_parameter_by_name(pauseMusic, "state", obj_player.character == UnknownEnum.Value_2);
    
    playeractiveState = obj_player.state;
    playerPalIndex = obj_player.palIndex;
    character = obj_player.character;
    active = true;
    FMODsetPauseAll(true);
    screenSprite = sprite_create_from_surface(application_surface, 0, 0, 960, 540, false, false, 0, 0);
    screenSprite2 = sprite_create_from_surface(obj_screensizer.gameSurface, 0, 0, 960, 540, false, false, 0, 0);
    instance_deactivate_all(true);
    instance_activate_object(obj_inputController);
    instance_activate_object(obj_screensizer);
    instance_activate_object(obj_fmod);
    instance_activate_object(obj_shell);
    instance_activate_object(obj_globaltimer);
    instance_activate_object(obj_savesystem);
    instance_activate_object(obj_onlineHandler);
    
    if (pauseMusic >= 0)
    {
        fmod_studio_event_instance_start(pauseMusic);
        fmod_studio_event_instance_set_paused(pauseMusic, false);
    }
    
    if (vinylSND >= 0)
    {
        fmod_studio_event_instance_start(vinylSND);
        fmod_studio_event_instance_set_paused(vinylSND, false);
    }
    
    fmod_studio_system_set_parameter_by_name("musicfade", 0, false);
    graphBack.alpha = 0;
    selected = 0;
    
    switch (playeractiveState)
    {
        case global.states.ski:
            tipText = lang_get_phrase("tip_ski");
            break;
        
        case global.states.surfing:
            tipText = lang_get_phrase("tip_surf");
            break;
        case global.states.skateboard:
		case global.states.skateboardAim:
		case global.states.skateboardIntro:
		case global.states.skateboardmove:
		case global.states.skateboardramp:
		case global.states.skateboardwall:
		tipText = "[wave][U][D][L][R] Aim [G] Charge [J] Jump"
		break;
        default:
            tipText = "";
            break;
    }
}

function doUnpause()
{
    audio_resume_all();
    instance_activate_all();
    FMODsetPauseAll(false);
    
    if (pauseMusic >= 0)
        fmod_studio_event_instance_stop(pauseMusic, UnknownEnum.Value_0);
    
    if (vinylSND >= 0)
        fmod_studio_event_instance_stop(vinylSND, UnknownEnum.Value_0);
    
    if (sprite_exists(screenSprite))
        sprite_delete(screenSprite);
    
    if (sprite_exists(screenSprite2))
        sprite_delete(screenSprite2);
    
    active = false;
}


_resume.offsetX = 960;
_option.offsetX = 960;
_restart.offsetX = 960;
_exitlevel.offsetX = 960;
array_push(options, _resume);
array_push(options, _option);
array_push(options, _restart);
array_push(options, _exitlevel);
timeUniform = shader_get_uniform(shd_wave, "time");
frequencyUniform = shader_get_uniform(shd_wave, "frequency");
amplitudeUniform = shader_get_uniform(shd_wave, "amplitude");
waveTime = 0;
freq = 0.01;
amp = 0.009;

activeOld = false