function is_transfo_all(arg0 = state)
{
    if (is_transfo_kill(arg0))
        return 1;
    
    return array_contains([global.states.coconut_intro, global.states.coconut_gun, global.states.coconut_shoot], arg0);
}

function is_transfo_kill(arg0 = state)
{
    return array_contains([global.states.snowball ,global.states.snowball_jump, global.states.snowball_wall, global.states.skateboard, global.states.skateboardAim, global.states.skateboardhitwall, global.states.skateboardIntro, global.states.skateboardmove, global.states.skateboardramp, global.states.skateboardwall, global.states.coconut_float], arg0);
}

function hurt_player(arg0 = -4)
{
    with (obj_player)
    {
        if (is_transfo_all())
            exit;
        
        if (i_frame > 0)
            exit;
        
        FMODevent_oneshot("event:/Sfx/Player/hurt", x, y);
        plrsnds_play(sfx.voice_hurt, x, y);
        global.collect -= 100;
        
        if (global.collect < 0)
            global.collect = 0;
        
        global.combo.timer -= 25;
        global.combo.timer = clamp(global.combo.timer, 0, 60);
        i_frame = 100;
        var sameFace = true;
        
        if (arg0 != -4)
        {
            var facing = sign(x - arg0.x);
            sameFace = xscale == facing;
            
            if (facing != 0)
                xscale = facing;
        }
        
        hsp = 8 * xscale;
        sprite_index = !sameFace ? spr_player_hurt : spr_player_hurt2;
        flash = true;
        state = global.states.hurt;
        vsp = -12;
        
        repeat (8)
        {
            create_particleDebri(spr_baddie_gibs, irandom_range(0, sprite_get_number(spr_baddie_gibs)), x, y, 1, -5);
            create_particleDebri(spr_slapstar, irandom_range(0, sprite_get_number(spr_slapstar)), x, y, 1, -5);
        }
        
        create_particleStatic(spr_hurteffect, x, y, 1);
    }
}

function doBump(arg0, arg1 = 4)
{
    var old_x = x;
    var old_y = y;
    x += (xscale * arg1);
    var ty = try_solid(0, -1, obj_solid, arg0);
    x = old_x;
    
    if (ty != -1)
    {
        y -= ty;
        x += xscale;
        
        if (scr_solid(x, y))
        {
            x = old_x;
            y = old_y;
            return true;
        }
        
        return false;
    }
    
    return true;
}

function try_solid(arg0, arg1, arg2, arg3)
{
    var old_x = x;
    var old_y = y;
    var n = -1;
    
    for (var i = 0; i < arg3; i++)
    {
        x += arg0;
        y += arg1;
        
        if (!scr_solid(x, y))
        {
            n = i + 1;
            break;
        }
    }
    
    x = old_x;
    y = old_y;
    return n;
}

function scr_Prank()
{
    return global.treasure && global.collect >= global.Srank && !global.combo.dropped && global.secretCount >= 3 && global.escapeLap >= 2;
}

function generalReset()
{
    instance_destroy(obj_lap2visual);
    instance_destroy(obj_comboTitle);
    instance_destroy(obj_hipnatuese);
    instance_destroy(obj_hipnatueseDead);
    instance_destroy(obj_whiteflash);
    
    if (!variable_global_exists("saveroom"))
        global.saveroom = ds_list_create();
    else
        ds_list_clear(global.saveroom);
    
    if (!variable_global_exists("escaperoom"))
        global.escaperoom = ds_list_create();
    else
        ds_list_clear(global.escaperoom);
    
    if (!variable_global_exists("followers"))
        global.followers = ds_list_create();
    else
        ds_list_clear(global.followers);
    
    fmod_studio_system_set_parameter_by_name("musicfade", 0, false);
    global.collect = 0;
    global.secretCount = 0;
    global.treasure = false;
    global.resetRoom = -4;
    global.level_timer = 0;
    global.save_timer = 0;
    global.level = -4;
    global.key = false;
    
    with (obj_player)
    {
        door = "A";
        visible = true;
        hallway = false;
        super = false;
		deadtimer = 0
        xscaleMulti = 1;
        yscaleMulti = 1;
        hitstun.is = false;
        supertaunt = 0;
        canSupertaunt = false;
    }
    
    with (obj_hud)
    {
        tv.sprite_index = spr_tv_off;
        combometer.y = -128;
        combometer.state = -1;
    }
    
    global.modifiers = 
    {
        flipped: false
    };
    global.escapeActive = false;
    global.escapeTimer = 7200;
    global.escapeMaxTimer = global.escapeTimer;
    global.escapeLap = 0;
    global.escapePartyOver = false;
    global.combo = 
    {
        dropped: false,
        amt: 0,
        timer: 60,
        previouscombo: 0,
        savecombo: 0,
        highest: 0
    };
    global.toppins = [0, 0, 0, 0, 0];
    
    if (!variable_global_exists("lap3checkpoint"))
    {
        global.lap3checkpoint = 
        {
            saveroom: ds_list_create(),
            escaperoom: ds_list_create()
        };
    }
    
    global.lap3checkpoint.collect = 0;
    global.lap3checkpoint.combo_amt = 0;
    global.lap3checkpoint.combo_dropped = 0;
    global.lap3checkpoint.secret = 0;
    global.lap3checkpoint.roomsaved = -4;
    global.lap3checkpoint.doorsaved = "fA";
    global.lap3checkpoint.toppins = global.toppins;
}

function doGrab()
{
    var move = global.pky_right + global.pky_left;
    
    if (slapBuffer > 0)
    {
		if global.jarona
		{
					image_index = 0
		state = global.states.jarona
		sprite_index = spr_player_grabcancel
		 scr_soundeffect(asset_get_index(string_concat("sfx_jarona", choose(1, 2, 3, 4))), 1, false)
		exit;
		}
        if (!(character == UnknownEnum.Value_2))
        {
            if (!global.pky_up)
            {
                slapBuffer = false;
                state = global.states.grab;
                sprite_index = sprites.grab;
                image_index = 0;
                create_particleStatic(spr_grabcloud, x, y, xscale, 1);
                
                if (movespeed < 8)
                    movespeed = 8;
            }
            else
            {
                FMODevent_oneshot("event:/Sfx/Player/uppercut", x, y);
                slapBuffer = false;
                
                if (coyote_time)
                    vsp = -17;
                else
                    vsp = -12;
                
                if (character == UnknownEnum.Value_1)
                {
                    vsp = -16;
                    
                    if (state == global.states.mach3 || sprite_index == sprites.longjump || sprite_index == sprites.longjumpend)
                        sprite_index = spr_playerV_mach_uppercut;
                    else
                        sprite_index = sprites.uppercut;
                }
                else
                {
                    sprite_index = sprites.uppercut;
                }
                
                image_index = 0;
                state = global.states.uppercut;
                create_particleStatic(spr_jumpeffect, x, y, 1, 1);
                squashX = 1.5;
                squashY = 0.6;
            }
        }
        else if (global.pky_up)
        {
            slapBuffer = false;
            
            if (move != 0)
			{

                xscale = move;
			}
                if (coyote_time)
                    vsp = -17;
                else
                    vsp = -12;
					
            movespeed = hsp;
            state = global.states.hammerwirl;
            sprite_index = spr_milton_dive;
            image_index = 0;
            FMODevent_oneshot("event:/Sfx/Player/uppercut", x, y);
            plrsnds_play(sfx.jump, x, y);
        }
        else
        {
            if (move != 0)
                xscale = move;
            
            vsp = 0;
            buffers.hammer = 25;
            slapBuffer = false;
            state = global.states.hammerattack;
            
            if (movespeed < 12)
                movespeed = 12;
            
            image_index = 0;
            sprite_index = spr_milton_hammerspin_prep;
        }
    }
}

function slope_momentum(arg0 = 0.1, arg1 = 0)
{
    var _obj = instance_place(x, y + 1, obj_slope);
    
    if (instance_exists(_obj))
    {
        if (scr_slope(x, y + 1))
        {
            if (sign(_obj.image_xscale) != xscale)
            {
                if (movespeed < 20)
                    movespeed += arg0;
            }
            else
            {
                movespeed -= arg1;
            }
        }
    }
}

function doTaunt(arg0 = false, arg1 = true)
{
    if (arg0 || global.pky_taunt2)
    {
        tauntVars = 
        {
            sprite_index: sprite_index,
            image_index: image_index,
            state: state,
            vsp: vsp,
            hsp: hsp,
            movespeed: movespeed,
            image_speed: image_speed
        };
        tauntTimer = 15;
        var _isSupertaunt = arg1 && canSupertaunt && global.pky_up;
        
        if (!_isSupertaunt)
        {
            state = global.states.taunt;
            image_speed = 0;
            sprite_index = sprites.taunt;
            image_index = irandom_range(0, image_number);
            instance_create(x, y, obj_taunteffect);
            instance_create(x, y, obj_parryhitbox);
            
            if (global.modded_phototaunt)
                scr_soundeffect(sfx_tauntold, random_range(0.95, 1.05));
            else
                plrsnds_play(sfx.taunt, x, y);
        }
        else
        {
            state = global.states.taunt;
            image_speed = 0.35;
            sprite_index = choose(spr_player_supertaunt1, spr_player_supertaunt2, spr_player_supertaunt3);
            image_index = 0;
            FMODevent_oneshot("event:/Sfx/Player/supertaunt", x, y);
            supertaunt = 0;
            canSupertaunt = false;
            instance_create(x, y, obj_taunteffect);
            
            with (obj_baddie)
            {
                if (in_camera())
                {
                    supertauntKill = true;
                    instance_destroy();
                }
            }
        }
        
        if (place_meeting(x, y, obj_exitgate) && global.combo.timer > 0 && global.escapeActive && global.level != "tutorial")
        {
            if (instance_place(x, y, obj_exitgate).tauntCount < 10)
            {
                obj_exitgate.tauntCount++;
                create_collect(spr_taunteffect, x, y);
                global.collect += 25;
                create_smalltext(25);
            }
        }
    }
}
function skatenic_is_tornado()
{
    with (obj_player)
        return character == 10 && (sprite_index == sprites.dive || sprite_index == spr_skatenic_diveground);
}

global.__baconera_cache = ds_map_create();

function get_baconera(arg0, arg1, arg2 = false)
{
    if (arg1 == 0)
        return arg0;
    
    var _arr1 = ["playerV", "milton", "pepperni", "player0", "player1", "player2", "player3", "playersoda", "preoutman", "skatenic", "playerSB", "trex", "pink2", "playerB5"];
    var _arr2 = ["V", "T", "P", "B0", "B1", "B2", "B3", "SODA", "POM", "S", "SB", "TR", "P2", "B5"];
    var _key = string(arg0) + "|" + string(arg1);
    
    if (ds_map_exists(global.__baconera_cache, _key))
        return global.__baconera_cache[? _key];
    
    var _asset = sprite_get_name(arg0);
    var _spr = arg0;
    var _result = arg0;
    
    if (string_starts_with(_asset, "spr_player"))
        _spr = asset_get_index(string_replace(_asset, "spr_player", "spr_" + _arr1[arg1 - 1]));
    else
        _spr = asset_get_index(string_concat(_asset, _arr2[arg1 - 1]));
    
    if (sprite_exists(_spr))
        _result = _spr;
    else if (arg2)
        return -4;
    
    global.__baconera_cache[? _key] = _result;
    return _result;
}

function playerUtil_realSpr()
{
    with (obj_player)
    {
        var sprReal = (character == UnknownEnum.Value_8) ? spr_playersoda_idle : sprite_index;
        var imgReal = (character == UnknownEnum.Value_8) ? clamp(palIndex - 1, 0, sprite_get_number(spr_playersoda_idle) - 1) : image_index;
        
        if (character == UnknownEnum.Value_9)
        {
            if (string_starts_with(sprite_get_name(sprite_index), "spr_preoutman_"))
            {
                sprReal = sprite_index;
            }
            else
            {
				if abs(hsp) >= 12 && abs(hsp) < 16
				sprReal = spr_preoutman_mach3
				else
                sprReal = (round(hsp) != 0) ? ((abs(hsp) > 16) ? spr_preoutman_mach : spr_preoutman_move) : spr_preoutman_idle;
                imgReal = (current_time / 1000) * 24;
            }
        }
else if character == 13
        {
            var sprReal = grounded ? spr_pink2_idle : (vsp > 0 ? spr_pink2_idledown : spr_pink2_idleup)
            if abs(hsp) > 12
                sprReal = grounded ? spr_pink2_move2ground : (vsp > 0 ? spr_pink2_move2down : spr_pink2_move2up)
            else if abs(hsp) > 0
                sprReal = grounded ? spr_pink2_move1ground : (vsp > 0 ? spr_pink2_move1down : spr_pink2_move1up)
            if state == global.states.buzzsaw
                sprReal = spr_pink2_move2down

            var _num = max(sprite_get_number(sprReal)-1,1)
            pink2timer += 0.25 + abs(hsp)/40
            if pink2timer > _num
                pink2timer = pink2timer mod _num

            imgReal = pink2timer
        }
		
	
        return [sprReal, imgReal];
    }
}

function playerUtil_spr(arg0)
{
    var st = 
    {
        player: {},
        tv: {}
    };
    st.player.patcolours = get_baconera(spr_playerPatCol, arg0);
    st.player.palettepreview = get_baconera(spr_dressermenu_palgrid, arg0);
    st.player.palette = get_baconera(spr_playerPalHalloween, arg0, 1);
    

        st.player.palette = get_baconera(spr_playerPal, arg0);
    
    st.player.pattern = get_baconera(spr_playerPat, arg0);
    st.player.clothes = get_baconera(spr_playerClothes, arg0);
    st.player.crouch = get_baconera(spr_player_crouch, arg0);
    st.player.crouchfall = get_baconera(spr_player_crouchfall, arg0);
    st.player.crouchhop = get_baconera(spr_player_crouchhop, arg0);
    st.player.crouchmove = get_baconera(spr_player_crouchmove, arg0);
    st.player.crouchstart = get_baconera(spr_player_crouchstart, arg0);
    st.player.idle = get_baconera(spr_player_idle, arg0);
    st.player.move = get_baconera(spr_player_move, arg0);
    st.player.jump = get_baconera(spr_player_jump, arg0);
    st.player.fall = get_baconera(spr_player_fall, arg0);
    st.player.land = get_baconera(spr_player_land, arg0);
    st.player.land2 = get_baconera(spr_player_land2, arg0);
    st.player.machslidestart = get_baconera(spr_player_machslidestart, arg0);
    st.player.machslide = get_baconera(spr_player_machslide, arg0);
    st.player.machslideend = get_baconera(spr_player_machslideend, arg0);
    st.player.walljumpstart = get_baconera(spr_player_walljumpstart, arg0);
    st.player.walljump = get_baconera(spr_player_walljump, arg0);
    st.player.wallclimb = get_baconera(spr_player_wallclimb, arg0);
    st.player.crouchslip = get_baconera(spr_player_crouchslip, arg0);
    st.player.mach1 = get_baconera(spr_player_mach1, arg0);
    st.player.mach2 = get_baconera(spr_player_mach2, arg0);
    st.player.mach2turn = get_baconera(spr_player_mach2turn, arg0);
    st.player.mach2turnfall = get_baconera(spr_player_mach2turnfall, arg0);
    st.player.mach2jump = get_baconera(spr_player_mach2jump, arg0);
    st.player.mach2jumpend = get_baconera(spr_player_mach2jumpend, arg0);
    st.player.mach3 = get_baconera(spr_player_mach3, arg0);
    st.player.mach3hit = get_baconera(spr_player_mach3hit, arg0);
    st.player.mach3jump = get_baconera(spr_player_mach3jump, arg0);
    st.player.mach3turn = get_baconera(spr_player_mach3turn, arg0);
    st.player.mach3turnfall = get_baconera(spr_player_mach3turnfall, arg0);
    st.player.superjump = get_baconera(spr_player_superjump, arg0);
    st.player.superjumpcancel = get_baconera(spr_player_superjumpcancel, arg0);
    st.player.superjumpcancelstart = get_baconera(spr_player_superjumpcancelstart, arg0);
    st.player.superjumpprep = get_baconera(spr_player_superjumpprep, arg0);
    st.player.superjumpprepstart = get_baconera(spr_player_superjumpprepstart, arg0);
    st.player.superjumpprepwalk = get_baconera(spr_player_superjumpprepwalk, arg0);
    st.player.spinout = get_baconera(spr_player_spinout, arg0);
    st.player.buzzsaw = get_baconera(spr_player_buzzsaw, arg0);
    st.player.buzzsawBump = get_baconera(spr_player_buzzsawBump, arg0);
    st.player.buzzsawCancel = get_baconera(spr_player_buzzsawCancel, arg0);
    st.player.buzzsawFastFall = get_baconera(spr_player_buzzsawFastFall, arg0);
    st.player.crazyrun = get_baconera(spr_player_crazyrun, arg0);
    st.player.longjump = get_baconera(spr_player_longjump, arg0);
    st.player.longjumpend = get_baconera(spr_player_longjumpend, arg0);
    st.player.rollstart = get_baconera(spr_player_rollstart, arg0);
    st.player.rolling = get_baconera(spr_player_rolling, arg0);
    st.player.rollgetup = get_baconera(spr_player_rollgetup, arg0);
    st.player.dive = get_baconera(spr_player_dive, arg0);
    st.player.divebomb = get_baconera(spr_player_divebomb, arg0);
    st.player.divebombland = get_baconera(spr_player_divebombland, arg0);
    st.player.taunt = get_baconera(spr_player_taunt, arg0);
    st.player.gateslam = get_baconera(spr_player_gateslam, arg0);
    st.player.entergate = get_baconera(spr_player_entergate, arg0);
    st.player.walkfront = get_baconera(spr_player_walkfront, arg0);
    st.player.airgrab = get_baconera(spr_player_airgrab, arg0);
    st.player.airgrabstart = get_baconera(spr_player_airgrabstart, arg0);
    st.player.grab = get_baconera(spr_player_grab, arg0);
    st.player.grabbump = get_baconera(spr_player_grabbump, arg0);
    st.player.grabcancel = get_baconera(spr_player_grabcancel, arg0);
    st.player.grabdive = get_baconera(spr_player_grabdive, arg0);
    st.player.groundpound = get_baconera(spr_player_groundpound, arg0);
    st.player.groundpoundcancel = get_baconera(spr_player_groundpoundcancel, arg0);
    st.player.groundpoundland = get_baconera(spr_player_groundpoundland, arg0);
    st.player.groundpoundstart = get_baconera(spr_player_groundpoundstart, arg0);
    st.player.uppercut = get_baconera(spr_player_uppercut, arg0);
    st.player.lookdoor = get_baconera(spr_player_lookdoor, arg0);
    st.player.wallsplat = get_baconera(spr_player_wallsplat, arg0);
    st.player.idleanim1 = get_baconera(spr_player_idleanim1, arg0, 1);
    st.player.idleanim2 = get_baconera(spr_player_idleanim2, arg0, 1);
    st.player.idleanim3 = get_baconera(spr_player_idleanim3, arg0, 1);
    st.player.idleanim4 = get_baconera(spr_player_idleanim4, arg0, 1);
    st.player.idleanim5 = get_baconera(spr_player_idleanim5, arg0, 1);
    st.player.breakdance = get_baconera(spr_player_breakdance, arg0);
    st.player.collect1 = get_baconera(spr_collect1, arg0);
    st.player.collect2 = get_baconera(spr_collect2, arg0);
    st.player.collect3 = get_baconera(spr_collect3, arg0);
    st.player.collect4 = get_baconera(spr_collect4, arg0);
    st.player.collect5 = get_baconera(spr_collect5, arg0);
	    st.player.spectate = get_baconera(spr_player_spectateinsolid, arg0);
    st.tv.bg = get_baconera(spr_tv_bg, arg0);
    st.tv.off = get_baconera(spr_tv_off, arg0);
    st.tv.empty = get_baconera(spr_tv_empty, arg0);
    st.tv.turnon = get_baconera(spr_tv_turnon, arg0);
    st.tv.trans = get_baconera(spr_tv_trans, arg0);
    st.tv.idle = get_baconera(spr_tv_idle, arg0);
    st.tv.mach = get_baconera(spr_tv_mach, arg0);
    st.tv.combo = get_baconera(spr_tv_combo, arg0);
    st.tv.happy = get_baconera(spr_tv_happy, arg0);
    st.tv.crazyrun = get_baconera(spr_tv_crazyrun, arg0);
    st.tv.escape = get_baconera(spr_tv_escape, arg0);
    st.tv.ski = get_baconera(spr_tv_ski, arg0);
    st.tv.secret = get_baconera(spr_tv_secret, arg0);
    return st;
}
