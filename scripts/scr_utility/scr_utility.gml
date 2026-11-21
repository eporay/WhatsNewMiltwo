gml_release_mode(true);
texturegroup_set_mode(true, false, spr_pixel);
scheduler_resolution_set(16);
gc_target_frame_time(-100);
ds_set_precision(0.001);
randomise();
global.wsbMOmInfo = {};
global.wsbMOmInfo.dir = game_save_id + "ohMiltu/";
global.wsbMOmInfo.opt = global.wsbMOmInfo.dir + "settings.xda";
global.username = $"player{irandom_range(1000, 9999)}";
global.wsbMOmInfo.options = ["Modded;machdoublejump;0", "Modded;phototaunt;0", "Modded;spammabletaunt;0", "Modded;oldsecreteye;0", "Modded;betterwaybackyard;0", "Modded;sloperotation;0"];
xdata_open(global.wsbMOmInfo.opt);

for (var i = 0; i < array_length(global.wsbMOmInfo.options); i++)
{
    global.wsbMOmInfo.options[i] = string_split(global.wsbMOmInfo.options[i], ";", true);
    global.wsbMOmInfo.options[i][2] = real(global.wsbMOmInfo.options[i][2]);
    var _e = global.wsbMOmInfo.options[i];
    variable_global_set($"{string_lower(_e[0])}_{_e[1]}", xdata_read(_e[0], _e[1], _e[2]));
}

window_enable_borderless_fullscreen(true);
global.MasterVolume = xdata_read("General", "Master", 1);
global.MusicVolume = xdata_read("General", "Music", 1);
global.SfxVolume = xdata_read("General", "Sfx", 0.8);
global.Fullscreen = xdata_read("General", "Fullscreen", 0);
global.Screenshake = xdata_read("General", "Screenshake", 1);
switch (global.Fullscreen)
{
    case 1:
        window_set_fullscreen(true);
        break;
    
    case 2:
        window_enable_borderless_fullscreen(true);
        window_set_fullscreen(true);
        break;
}

global.vsync = xdata_read("General", "Vsync", false);
global.hide_hud = xdata_read("Visual", "showHud", false);
global.unfocus_mute = xdata_read("General", "UnfocusMute", true);
global.dirSuper = xdata_read("General", "dirSuper", true);
global.dirGround = xdata_read("General", "dirGround", true);
global.windowSize = xdata_read("General", "Windowsize", 1);
global.texFilter = xdata_read("General", "texFilter", false);
global.DarkMode = xdata_read("General", "DarkMode", 0);
global.twistedpause = xdata_read("General", "twistedpause", 0);
global.VoiceClips = xdata_read("General", "VoiceClips", 1);
display_reset(0, global.vsync);
gpu_set_tex_filter(global.texFilter);
var res = [[480, 270], [960, 540], [1024, 576], [1280, 720], [1600, 900], [1920, 1080]];
window_set_size(res[global.windowSize][0], res[global.windowSize][1]);
window_center();
xdata_close();
function scr_createmonolithblock(active = 0)
{
	with (instance_create(x, y, active ? obj_monolithblock_sleep : obj_monolithblock_wake))
	{
		image_xscale = other.image_xscale
		image_yscale = other.image_yscale
	}
	instance_destroy()
}
function scr_pauseWSBNEW()
{
		if !variable_instance_exists(id, "newwsb") || newwsb = 0
	{

		secrets = []
		treasureAlpha = 0;
		backgroundhearts = [];
array_push(secrets, 
{
    x: 54,
    y: 136,
    index: 0,
    secret: false,
    scale: 1
});
array_push(secrets, 
{
    x: 94,
    y: 54,
    index: 1,
    secret: false,
    scale: 1
});
array_push(secrets, 
{
    x: 151,
    y: 115,
    index: 2,
    secret: false,
    scale: 1
});
		newwsb = 1
	}
	if (active)
    {
        shader_set(shd_wave);
        shader_set_uniform_f(timeUniform, waveTime);
        waveTime++;
        shader_set_uniform_f(frequencyUniform, freq);
        shader_set_uniform_f(amplitudeUniform, amp);
        draw_sprite(screenSprite, 0, 0, 0);
        shader_reset();
        draw_set_alpha(graphBack.alpha);
		
        draw_set_color(global.DarkMode ? merge_colour(#FFB7AD, c_black, 0.8) : #FFB7AD);
        draw_rectangle(0, 0, obj_screensizer.displayWidth, obj_screensizer.displayHeight, false);
        draw_set_color(c_white);
        draw_set_alpha(1);
    }
    
    for (var i = 0; i < array_length(backgroundhearts); i++)
    {
        var q = backgroundhearts[i];
        draw_set_alpha(q.image_alpha);
        draw_sprite(q.sprite_index, q.image_index, q.x, q.y);
        draw_set_alpha(1);
    }
    
    var xx = obj_screensizer.displayWidth / 2;
    var yy = (obj_screensizer.displayHeight / 2) - (90 * ((array_length(options) - 1) / 2));
    
    for (var i = 0; i < array_length(options); i++)
    {
        var q = options[i];
        
        if (!active)
            q.offsetX = lerp(q.offsetX, -obj_screensizer.displayWidth, 0.2);
        else
            q.offsetX = lerp(q.offsetX, 0, 0.2);
        
        if (is_struct(q))
        {
            draw_sprite(spr_pause_letter, selected != i, xx + q.offsetX, yy + (90 * i));
            draw_set_font(global.bigfont);
            draw_set_color((selected == i) ? c_white : #B871A6);
            draw_set_halign(fa_center);
            draw_textEX(xx + q.offsetX + ((sprite_get_width(spr_pauseicons) / 4) * q.icon.alpha), yy + (90 * i), lang_get_phrase(q.option));
            draw_set_alpha(q.icon.alpha);
            draw_sprite(spr_pauseicons, q.icon.index, floor((xx + irandom_range(-1, 1)) - (string_width(lang_get_phrase(q.option)) / 2) - 50) + q.offsetX + 42, floor(yy + (90 * i) + irandom_range(-1, 1)));
            draw_set_alpha(1);
            q.icon.alpha = approach(q.icon.alpha, selected == i, 0.1);
        }
    }
    
    draw_sprite_ext(spr_pauseBorderNEW, 0, obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight / 2, graphBorderSize, graphBorderSize, 0, c_white, 1);
    
    for (var i = 0; i < array_length(secrets); i++)
    {
        var q = secrets[i];
        var _XX = q.x;
        var _YY = q.y;
        
        if (!q.secret)
        {
            _XX = q.x + irandom_range(-1, 1);
            _YY = q.y + irandom_range(-1, 1);
        }
        
        if (active)
        {
            if (graphBorderSize == 1)
            {
                var _isSecret = global.secretCount > q.index;
                
                if (q.secret != _isSecret)
                {
                    q.scale = 2;
                    q.secret = _isSecret;
                }
            }
        }
        
        q.scale = approach(q.scale, 1, 0.1);
        
        if (global.level != -4)
            draw_sprite_ext(q.secret ? spr_pauseHeart_fullNEW : spr_pauseHeart_emptyNEW, q.index, _XX, _YY, q.scale, q.scale, 0, c_white,treasureAlpha);
    }
    
    if (global.level != -4)
    {
        draw_set_alpha(treasureAlpha);
        draw_sprite(spr_treasure_pause, global.treasure ? 0 : 1, 851, 457);
        draw_set_alpha(1);
    }
    
    treasureAlpha = approach(treasureAlpha, active, 0.1);
    graphBorderSize = lerp(graphBorderSize, active ? 1 : 2, 0.3);
    
    if (active)
    {
        if (tipText != "")
        {
            draw_set_font(global.creditsfont);
            draw_set_color(c_white);
            draw_set_halign(fa_center);
            draw_textEX(obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight - 64, tipText);
            draw_set_alpha(1);
        }
    }
}
function scr_pauseTTWOB()
{
	if !variable_instance_exists(id, "ttwob")
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
	
	if (active)
	{
	    shader_sset(shd_waveTTWOB);
		if ttwob_buf < 0
			ttwob_buf = lerp(ttwob_buf, -1, 0.02)
		else
			ttwob_buf = lerp(ttwob_buf, -0.25, 0.045)
		waveTime -= ttwob_buf
	    shader_set_uniform_f(timeUniform, waveTime);
	    shader_set_uniform_f(frequencyUniform, 0.034);
	    shader_set_uniform_f(amplitudeUniform, 0.01);
		gpu_set_blendenable(false)
	    draw_sprite(screenSprite, 0, 0, 0);
		gpu_set_blendenable(true)
		draw_sprite(screenSprite2, 0, 0, 0);
	    shader_reset();
	    draw_set_alpha((graphBack.alpha/0.55)*0.5);
	    draw_set_colour(c_black);
	    draw_rectangle(0, 0, 960, 540, false);
	    draw_set_colour(c_white);
	    draw_set_alpha(1);
	}
	
	if active && !ttwob_activeOld
	{
		ttwob_buf = 11
		ttwob_circless = []
		for (var i = 0; i < 32; i++)
			array_push(ttwob_circless, [860-i*4, random(540), random_range(60, 100)/100])
		ttwob_hsp = -1
		x = 360
	}
	if ttwob_activeOld != active
		ttwob_activeOld = active
	
	if active
	{
		x = approach(x, 0, 1)
		x = lerp(x, 0, 0.05)
		ttwob_hsp = approach(ttwob_hsp, -4, 0.1)
		array_push(ttwob_circless, [960, random(540), random_range(60, 100)/100])
	}
	else
	{
		if ttwob_hsp == 0 || x == 960
		{
			x = 360
			ttwob_hsp = 0
			ttwob_circless = []
		}
		else
		{
			for (var i = 0; i < 7; i++)
				array_push(ttwob_circless, [960-i*64, random(540), random_range(60, 100)/100])
			ttwob_hsp = -128
			x = approach(x, 960, 48)
		}
	}
	
	draw_rectangle(x+835-2, 0, 960, 540, false)
	for (var i = array_length(ttwob_circless)-1; i >= 0; i--)
	{
		var _q = ttwob_circless[i]
		ttwob_circless[i][0] += _q[2]*ttwob_hsp
		var _s = (_q[0]-960)/6.5
		_s = 96+_s+2
		if _s < 0
		{
			array_delete(ttwob_circless, i, 1)
			continue
		}
		draw_circle(x+_q[0], _q[1], _s, false)
	}
	draw_set_colour(c_black)
	draw_rectangle(x+835, 0, 960, 540, false)
	for (var i = array_length(ttwob_circless)-1; i >= 0; i--)
	{
		var _q = ttwob_circless[i]
		var _s = (_q[0]-960)/6.5
		_s = 96+_s
		if _s > 0
			draw_circle(x+_q[0], _q[1], _s, false)
	}
	if active
	{
		draw_set_colour(c_white)

		draw_set_font(global.bigfont)
		draw_set_valign(0)
		draw_set_halign(1)
		var _offy = 270+(array_length(options)/2)*-48
		for (var i = 0; i < array_length(options); i++)
		{
			var _txt = lang_get_phrase(options[i].option)
			ttwob_pausealpha[i] = approach(ttwob_pausealpha[i], selected == i, 0.1)
			draw_set_alpha(1)
			draw_set_colour(selected == i ? c_white : c_grey)
			draw_text(736, _offy+i*48, _txt)
			    var q = options[i];
			draw_set_alpha(ttwob_pausealpha[i])
			            if (is_struct(q.icon))
            {
                draw_set_alpha(q.icon.alpha);
                draw_sprite(spr_pauseicons, q.icon.index, floor((736 + irandom_range(-1, 1)) - (string_width(_txt) / 2) - 50), floor(_offy+i*48 + irandom_range(-1, 1)));
                draw_set_alpha(1);
                q.icon.alpha = approach(q.icon.alpha, selected == i, 0.1);
            }
		}
		draw_set_alpha(1)
		draw_set_halign(0)

		ttwob_cursor_x = lerp(ttwob_cursor_x, 736+string_width(lang_get_phrase(options[selected].option))/2 + 20, 0.075)
		ttwob_cursor_y = lerp(ttwob_cursor_y, _offy+selected*48, 0.1)
	}
	else
	{
		ttwob_cursor_x = lerp(ttwob_cursor_x, 1080, 0.075)
		ttwob_cursor_y = lerp(ttwob_cursor_y, -128, 0.1)
	}
	draw_sprite(spr_uparrow,0, ttwob_cursor_x, ttwob_cursor_y)
	    if (active)
    {
        if (tipText != "")
        {
            draw_set_font(global.creditsfont);
            draw_set_color(c_white);
            draw_set_halign(fa_center);
            draw_textEX(obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight - 64, tipText);
            draw_set_alpha(1);
        }
    }
}
function loadString(arg0)
{
    if (file_exists(arg0))
    {
        var _buff = buffer_load(arg0);
        var _str = buffer_read(_buff, buffer_string);
        buffer_delete(_buff);
        return _str;
    }
    else
    {
        return "";
    }
}
function chance(percent) {
	return percent > random(1);
}
function load_textures(_groups)
{
	with instance_create(0, 0, obj_loadingMini)
	{
		groups = _groups
		textures = []
			
		for (var i = 0; i < array_length(groups); i++) {
			array_push(textures, texturegroup_get_textures(groups[i]))
		}
		texturesMax = array_length(textures)
	}
}

function unload_textures(_textures)
{
	if _textures != noone
	{
		var _rep = array_length(_textures)
		repeat _rep
		{
			if (array_length(_textures)) 
			{
				var group = _textures[0]
				for (var i = 0; i < array_length(group); i++)
				{
					if texture_is_ready(group[i])
					{
						show_debug_message($"unloaded texture page {group[i]}")
						texture_flush(group[i])
					}
				}
				array_shift(_textures)
			}
		}
		
	}
}
function gpu_set_blendmode_default()
{
    gpu_set_blendmode(bm_normal);
}

function scr_fadeout(arg0 = 0.1)
{
    if (instance_exists(obj_fadeout))
    {
        with (obj_fadeout)
        {
            if (!fadein)
            {
                instance_destroy(obj_fadeout);
                
                with (instance_create(0, 0, obj_fadeout))
                    accel = arg0;
                
                return true;
            }
        }
    }
    else
    {
        with (instance_create(0, 0, obj_fadeout))
            accel = arg0;
        
        return true;
    }
    
    return false;
}

function shader_sset(arg0)
{
    shader_set(arg0);
}

function levelgetname(arg0)
{
    switch (arg0)
    {
        case "dudles":
            return "(WIP) Dudles in the Notebook";
        
        case "tutorial":
            return "Overgrown Flo' Patch";
        
        case "yard":
            return "Waybackyard";
        
        case "shell":
            return "Shell O' City";
        
        case "beach":
            return "(WIP) Fruitcup Coast";
        
        case "frontyard":
            return "(WIP) Beaker's Frontyard";
        
        case "clock":
            return "(WIP) Courted Clocks";
        
        case "outbreak":
            return "(WIP) Radiation Outbreak";
        
        case "milkshake":
            return "(WIP) Milkshake Peaks";
                case "castle":
            return "(WIP) Castle Pumpkinstein";
        case "crashout":
            return "Crashout City (Crashout)";
        
        case "bottom":
            return "Rock Bottom (Dream)";
        
        case "beaker":
            return "(WIP) Beaker Backyard (Twisted)";
    }
    
    return arg0;
}

function scr_savelevel()
{
    xdata_open(global.saveFile);
    var _rankString = "D";
    
    if (scr_Prank())
        _rankString = "P";
    else if (global.collect >= global.Srank)
        _rankString = "S";
    else if (global.collect >= global.Arank)
        _rankString = "A";
    else if (global.collect >= global.Brank)
        _rankString = "B";
    else if (global.collect >= global.Crank)
        _rankString = "C";
    
    if (xdata_read(global.level, "Highscore", 0) < global.collect)
    {
        xdata_write(global.level, "Highscore", global.collect);
        xdata_write(global.level, "Rank", _rankString);
        xdata_write(global.level, "Toppin1", global.toppins[0]);
        xdata_write(global.level, "Toppin2", global.toppins[1]);
        xdata_write(global.level, "Toppin3", global.toppins[2]);
        xdata_write(global.level, "Toppin4", global.toppins[3]);
        xdata_write(global.level, "Toppin5", global.toppins[4]);
        xdata_write(global.level, "Treasure", global.treasure);
        xdata_write(global.level, "Secrets", global.secretCount);
    }
    
    obj_savesystem.saveiconTimer = 60;
    xdata_close();
}

function animation_end()
{
    return (image_index + (image_speed * sprite_get_speed(sprite_index))) >= image_number;
}

function shake_camera(arg0, arg1)
{
    if (is_undefined(arg1))
        arg1 = arg0;
    
    obj_camera.cameraShakeTimer += arg1;
    obj_camera.cameraShake += arg0;
}

function tv_anim(arg0, arg1 = 0)
{
    with (obj_hud.tv)
    {
        if (expressionSprite != arg0)
        {
            switchindex = 0;
            state = global.states.move;
            expressionSprite = arg0;
            expressionTimer = arg1;
        }
    }
}

function instance_create(arg0, arg1, arg2, arg3 = {})
{
    return instance_create_depth(arg0, arg1, 0, arg2, arg3);
}

function scr_cutoff()
{
    for (var _x = 0; _x < abs(sprite_width / 32); _x++)
    {
        with (instance_create(x + (_x * 32) + 32, y, obj_cutoff))
            image_angle = 180;
        
        instance_create(x + (_x * 32), y + sprite_height, obj_cutoff);
    }
    
    for (var _y = 0; _y < abs(sprite_height / 32); _y++)
    {
        with (instance_create(x + sprite_width, y + (_y * 32) + 32, obj_cutoff))
            image_angle = 90;
        
        with (instance_create(x, y + (_y * 32), obj_cutoff))
            image_angle = -90;
    }
}

function create_smalltext(arg0, arg1 = x, arg2 = y)
{
    instance_create(arg1, arg2, obj_smalltext).text = arg0;
}

function in_camera(arg0 = bbox_left, arg1 = bbox_right, arg2 = bbox_bottom, arg3 = bbox_top)
{
    var camx = camera_get_view_x(view_camera[0]);
    var camy = camera_get_view_y(view_camera[0]);
    var camw = camera_get_view_width(view_camera[0]);
    var camh = camera_get_view_height(view_camera[0]);
    return arg0 < (camx + camw) && arg1 > camx && arg3 < (camy + camh) && arg2 > camy;
}

function tile_delete(arg0, arg1)
{
    var layers = layer_get_all();
    
    for (var i = 0; i < array_length(layers); i++)
    {
        var lay = layers[i];
        var layer_name = layer_get_name(lay);
        
        if (layer_name != "Tiles_BG1" && layer_name != "Tiles_BG" && layer_name != "Tiles_BG2" && layer_name != "Tiles_BG3")
        {
            var ID = layer_get_id(layer_name);
            var tilemapID = layer_tilemap_get_id(ID);
            var tiledata = tilemap_get_at_pixel(tilemapID, arg0, arg1);
            tile_set_empty(tiledata);
            tilemap_set_at_pixel(tilemapID, 0, arg0, arg1);
        }
    }
}

function escape_background(arg0, arg1)
{
    for (var i = 0; i < array_length(layers_name); i++)
    {
        var ID = layer_get_id(layers_name[i]);
        var BGID = layer_background_get_id(ID);
        var BGSPR = layer_background_get_sprite(BGID);
        
        if (BGSPR == arg0 && global.escapeActive)
            layer_background_sprite(BGID, arg1);
        else if (BGSPR == arg1 && !global.escapeActive)
            layer_background_sprite(BGID, arg0);
    }
}

function scr_transfotip(arg0)
{
    instance_destroy(obj_transfotip);
    
    with (instance_create(x, y, obj_transfotip))
    {
        text = arg0;
        return id;
    }
    
    return -4;
}

function timeString(arg0)
{
    var _ms = array_last(string_split(string_format(arg0, 0, 2), "."));
    arg0 = floor(arg0);
    var _s = arg0 % 60;
    _s = ((_s < 10) ? "0" : "") + string(_s);
    var _m = floor(arg0 / 60) % 60;
    _m = ((_m < 10) ? "0" : "") + string(_m);
    var _h = floor(arg0 / 3600);
    _h = ((_h < 10) ? "0" : "") + string(_h);
    return string("{0}:{1}:{2}.{3}", _h, _m, _s, _ms);
}
