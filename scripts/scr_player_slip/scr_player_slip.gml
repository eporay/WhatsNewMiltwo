function scr_player_slip()
{
    hsp = movespeed * xscale;
    image_speed = 0.35;
    
    if (place_meeting(x + hsp, y, obj_solid))
    {
        create_particleStatic(spr_bangeffect, x, y, 1);
        sprite_index = spr_player_spinout;
        xscale *= -1;
        FMODevent_oneshot("event:/Sfx/Player/slipbump", x, y);
    }
    
    if (!grounded && sprite_index == spr_player_beakerintro)
        sprite_index = spr_player_spinout;
    
    if (grounded)
    {
		if sprite_index = spr_player_buzzsaw
		{
			
						movespeed = hsp * xscale
			movespeed = abs(hsp)
			if movespeed < 13
            movespeed = 13;
            flash = true;
            state = global.states.mach3;
            image_index = 0;
            sprite_index = sprites.mach3;
		}
        if (sprite_index == spr_player_slipsyrup)
        {
            vsp = -5;
            create_particleStatic(spr_bangeffect, x, y, 1);
            sprite_index = spr_player_spinout;
            image_index = 0;
            FMODevent_oneshot("event:/Sfx/Player/slipbump", x, y);
        }
        
        if (sprite_index == spr_player_spinout)
        {
            FMODevent_oneshot("event:/Sfx/Player/slipend", x, y);
            sprite_index = spr_player_beakerintro;
            image_index = 0;
        }
        
        movespeed = approach(movespeed, 0, 0.5);
    }
    
    if (animation_end() && (sprite_index == spr_player_slipsyrup || sprite_index == spr_player_beakerintro))
    {
        image_index = image_number - 1;
        
        if (movespeed == 0 && grounded && sprite_index == spr_player_beakerintro)
        {
            state = global.states.normal;
            movespeed = 0;
            sprite_index = sprites.land;
        }
    }
}
function scr_player_slip_bacon5()
{
	static Savelevel = function()
	{

		
        with (obj_onlineHandler)
        {
            var _rankString = "D";
            
            if (global.collect >= global.Crank)
                _rankString = "C";
            
            if (global.collect >= global.Brank)
                _rankString = "B";
            
            if (global.collect >= global.Arank)
                _rankString = "A";
            
            if (global.collect >= global.Srank)
                _rankString = "S";
            
            if (scr_Prank())
                _rankString = "P";
            
            lastestMessageNum = wrap(lastestMessageNum + 1, 123, 233);
			if global.racemode.active
			lastestMessage = $" beat the race in {timeString(global.level_timer)}"
			else
            lastestMessage = " beat " + levelgetname(global.level) + " (" + _rankString + " Rank - " + ((global.escapeLap > 0) ? $"Lap {global.escapeLap}" : "No Laps") + ")";
        }
        
xdata_open(global.saveFile);
		var hasbeaten = xdata_read(global.level, "TimeSet", 0);
		var personalbest = xdata_read(global.level, "PersonalBest", 0);
		if !hasbeaten || global.level_timer < personalbest 
		{
		xdata_write(global.level, "PersonalBest", global.level_timer);
		xdata_write(global.level, "TimeSet", 1);


		//scr_soundeffect(sfx_newrecord, 1, false);
		
		}
xdata_close()
        global.combo.savecombo = global.combo.amt;
        
        if (global.combo.savecombo > global.combo.highest)
            global.combo.highest = global.combo.savecombo;
        
        if (global.combo.amt > 0 && global.combo.timer > 0)
            global.collect += (10 * global.combo.savecombo);

        scr_savelevel();
	}
    hsp = movespeed * xscale;
    image_speed = 0.35;
    
    if (place_meeting(x + hsp, y, obj_solid) && !grounded)
    {
        create_particleStatic(spr_bangeffect, x, y, 1);
        xscale *= -1;
        FMODevent_oneshot("event:/Sfx/Player/slipbump", x, y);
    }
    
    if (place_meeting(x + hsp, y, obj_solid) && grounded)
    {
        movespeed *= -1;
       scr_soundeffect(sfx_playerB5_folp, random_range(1.1, 1.3))
    }
    
 if (vsp > 0)
        vsp += 1;
    
    if (grounded)
    {
        global.combo.timer = 60;
        canSupertaunt = 0;
        supertaunt = 0;
        
        if (sprite_index == spr_playerB5_mach3turnfall)
        {
            audio_stop_all();
			FMODstopAll()
            global.escapeActive = false;

            instance_destroy(par_potable);
            instance_create(0, 0, obj_whiteflash);
            create_particleStatic(spr_hurteffect, x, y + 30, 1);
            create_particleStatic(spr_bangeffect, x, y + 30, 1, 1);
            
            repeat (150)
                instance_create(x, y, obj_playerB5_gibs);
            
            repeat (50)
                instance_create(x, y, obj_playerB5_gibs2);
            
            scr_soundeffect(sfx_playerB5_death);
            
            
                sprite_index = spr_playerB5_die;
                squashX = 2;
                squashY = 0.5;
            Savelevel()
        }
        
        if (irandom(100) == 100 && movespeed == 0)
        {
            squashX = random_range(0.98, 1.02);
            squashY = random_range(0.98, 1.02);
            movespeed = random_range(-1, 1);
			scr_soundeffect(sfx_playerB5_folp, random_range(0.8, 1.3))
           
        }
        deadtimer++
		if deadtimer >= 300
		{
			
			    if (audio_sound_get_asset(global.music) != mu_bacon5dead)
        scr_music(mu_bacon5dead, true);
			with (obj_camera)
			{
		
            xOffset = approach(xOffset, 0, 8);
        
        
        camera.x = camera.target.x + xOffset;

        var _t = camera.zoom;
        _t = _t * _t;
        camera.y = approach(camera.y, camera.target.y, 0.00053) 
			state = -6
			var maxx = 0.5
			    camera.zoom = approach(camera.zoom,maxx, 0.00053);
				if camera.zoom = maxx
				{

            		unload_textures(global.level_loaded_pages)
            if (instance_exists(obj_backtohub))
                instance_destroy(obj_backtohub);
            state = global.states.normal
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
		}
        instance_create_depth(x + random_range(-30, 30), y + 40, depth + 1, obj_playerB5_blood);
        movespeed = approach(movespeed, 0, 0.075);
    }
    else if sprite_index != spr_playerB5_die
    {
        sprite_index = spr_playerB5_mach3turnfall;
    }
    
    
}
