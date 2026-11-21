
    grav = 0.5;
    
    if (character == UnknownEnum.Value_5 && vsp >= 20)
        vsp += grav;


var yaya = ((place_meeting(x, y, obj_dresser) || place_meeting(x, y, obj_levelremovetimes)|| place_meeting(x, y, obj_door) || place_meeting(x, y, obj_levelgate) || (instance_place(x, y, obj_exitgate) > 0 && instance_place(x, y, obj_exitgate).openn)) && grounded) * (global.pky_up ? 2 : (global.pky_down ? 0.5 : 1));
uparrowadd = lerp(uparrowadd, (yaya - uparrow) * 0.15, 0.5);
    if (coyote_time && vsp > 0 && character = 12)
    {
glidejump = 0
    }
	if global.racemode.active
	{
		if abs(hsp) > fastestspeed
		fastestspeed = abs(hsp)
	}
	else
	{
		fastestspeed = 0
	}
	if spectateID != -4
	{
		state =global.states.spectate
	}
	if state != global.states.hammerattack
	{
		hammerexplodeeffect =0
	}
if (yaya)
{
    if (state == global.states.enterdoor || instance_exists(obj_rank))
        uparrow = approach(uparrow, 3, 0.2);
    else
        uparrow += uparrowadd;
}
else
{
    uparrow += uparrowadd;
}
if (instance_exists(obj_onlineProphunt))
{
    if (global.prophuntmode.select != -4)
    {
        if (mouse_wheel_up())
            global.prophuntmode.select--;
        
        if (mouse_wheel_down())
            global.prophuntmode.select++;
        
        global.prophuntmode.select = clamp(global.prophuntmode.select, 0, array_length(global.prophuntmode.sprites) - 1);
    }
}

depth = -5;

if (global.modded_sloperotation)
{
    var _angle = 0;
    
    with (obj_slope)
    {
        with (other)
        {
            var _angle2 = sign(other.image_xscale) * 45;
            _angle2 *= lerp(1, 0.8, clamp(abs(other.image_yscale) / abs(other.image_xscale), 0, 1));
            _angle2 *= clamp((max(0, abs(other.sprite_width) - 24) - point_distance(x, bbox_bottom, abs(other.bbox_left + other.bbox_right) / 2, abs(other.bbox_top + other.bbox_bottom) / 2)) / max(0, abs(other.sprite_width) - 24), 0, 1);
            
            if (abs(_angle2) > abs(_angle))
                _angle = _angle2;
        }
    }
    
    angle = _angle;
}
else if (character == UnknownEnum.Value_4)
{
    if (place_meeting(x, y + 1, obj_slope))
    {
        var _obj = instance_place(x, y + 1, obj_slope);
        
        if (abs(_obj.image_yscale) < abs(_obj.image_xscale))
            angle = lerp(angle, 10 * _obj.image_xscale, 0.5);
        else
            angle = lerp(angle, 45 * sign(_obj.image_xscale), 0.5);
    }
    else
    {
        angle = lerp(angle, 0, 0.5);
    }
}
else
{
    angle = 0;
}

instakill = skatenic_is_tornado() || sprite_index = spr_milton_longjump || sprite_index = spr_milton_longjumpend ||state = global.states.jaronalaunch || state = global.states.coconut_float || (state = global.states.climbwall && character = 10)|| state == global.states.dreamcrusher || state == global.states.water || sprite_index == spr_milton_dive || state == global.states.slip || state == global.states.mach3 || state == global.states.skateboard || state == global.states.skateboardwall || state == global.states.skateboardramp || state == global.states.skateboardmove || state == global.states.hammerattack || (state == global.states.machturn && sprite_index == sprites.mach3turn) || state == global.states.superjump || state == global.states.uppercut || state == global.states.groundpound || state == global.states.groundpoundstart || state == global.states.buzzsaw || state == global.states.snowball || state == global.states.snowball_jump || state == global.states.snowball_wall;

if (hitstun.is == false)
{
    if (!instance_exists(obj_technicaldifficulty) && obj_player.state != global.states.enterdoor && obj_player.state != global.states.skateboardIntro && obj_player.state != global.states.walkfront && !instance_exists(obj_fadeout) && obj_player.state != -4)
        global.combo.timer = approach(global.combo.timer, 0, 0.15);
    
    if (global.combo.previouscombo != global.combo.amt)
    {
        global.combo.previouscombo = global.combo.amt;
        
        if (global.combo.amt > 0 && (global.combo.amt % 5) == 0)
        {
            instance_destroy(obj_comboTitle);
            
            with (instance_create(811, 350, obj_comboTitle))
            {
                combo = floor(global.combo.amt / 5);
                
                if (floor(global.combo.amt / 5) > 15)
                    very = true;
                
                combo = wrap(combo, 0, 14);
                image_index = self.getProper(combo);
            }
            
            FMODevent_oneshot("event:/Sfx/UI/Combo/comboup");
        }
    }
    
    if (global.combo.timer == 0 && global.combo.amt > 0)
    {
        global.combo.savecombo = global.combo.amt;
        
        if (global.combo.savecombo > global.combo.highest)
            global.combo.highest = global.combo.savecombo;
        
        global.combo.amt = 0;
        
        if (!instance_exists(obj_rank))
        {
            if (!global.combo.dropped)
                FMODevent_oneshot("event:/Sfx/UI/Combo/prankfail");
            
            global.combo.dropped = true;
            FMODevent_oneshot("event:/Sfx/UI/Combo/comboend");
            instance_destroy(obj_comboTitle);
            
            with (instance_create(811, 350, obj_comboTitle))
            {
                combo = floor(global.combo.savecombo / 5);
                
                if (floor(global.combo.savecombo / 5) > 15)
                    very = true;
                
                lostcombo = true;
                combo = wrap(combo, 0, 14);
                image_index = self.getProper(combo);
                points = 10 * global.combo.savecombo;
                global.collect += points;
            }
        }
    }
    
    if (character == UnknownEnum.Value_8)
        sfx.laugh = asset_get_index(string("sfx_playersoda{0}", array_get(playerUtil_realSpr(), 1)));
    
    if (character == UnknownEnum.Value_5)
    {
        switch (state)
        {
            case global.states.normal:
            case global.states.jump:
            case global.states.mach2:
            case global.states.mach3:
            case global.states.dreambounce:
                if (global.pky_up && global.pky_jump2 && !grounded)
                {
                    state = global.states.dreamcrusher;
                    vsp = -17;
                    plrsnds_play(sfx.jump, x, y);
                    FMODevent_oneshot("event:/Sfx/Player/slip", x, y);
                    sprite_index = spr_player1_umbrellaStart;
                    image_index = 0;
                }
        }
    }
        if (character == 10)
    {
        switch (state)
        {
case global.states.normal:
            case global.states.jump:
            case global.states.mach2:
            case global.states.mach3:
            case global.states.climbwall:
			case global.states.tumble:
                if (global.pky_up && global.pky_jump2 && !grounded)
                {
                    state = global.states.dreamcrusher;
                    vsp = -16;
                    plrsnds_play(sfx.jump, x, y);
                    FMODevent_oneshot("event:/Sfx/Player/slip", x, y);
                    sprite_index = spr_skatenic_crusherstart;
                    image_index = 0;
                }
        }
    }
    if (grounded)
    {
        freefalling = 0;
        coyote_time = 10;
    }
    else if (vsp < 0)
    {
        coyote_time = 0;
    }
    
    coyote_time--;
    
    if (state != global.states.hurt)
        i_frame = approach(i_frame, 0, 1);
    
    if (i_frame > 0 && state != global.states.hurt)
        image_alpha = round(wave(0, 1, 0.1, 0));
    else
        image_alpha = 1;
    
    if (state == global.states.walkfront && sprite_index == sprites.walkfront)
        image_blend = make_colour_hsv(0, 0, (image_index / image_number) * 255);
    else
        image_blend = make_colour_hsv(0, 0, 255);
    
    if (flash == true && alarm[0] <= 0)
        alarm[0] = 5;
    
    if (y < -500 || (y > (room_height + 500) && state != -4 && !instance_exists(obj_fadeout)))
    {
        if (!instance_exists(obj_technicaldifficulty))
        {
            instance_create(x, y, obj_technicaldifficulty);
            shake_camera(25);
            plrsnds_play(sfx.slam, x, y);
        }
    }
    
    if (state >= 0)
    {
        var _asset = asset_get_index("scr_player_" + global.state_names[state]);
        
        if (script_exists(_asset))
            script_execute(_asset);
    }
    
    mask_index = spr_player_mask;
    mask_index = (scr_solid(x, y) || (state == global.states.crouch || state == global.states.tumble || state == global.states.superjumpprep)) ? spr_crouchmask : spr_player_mask;
    scr_collide_destructibles();
    scr_collision();
    scr_collide_destructibles();
}
else if (hitstun.time > 0)
{
    image_speed = 0;
    x = hitstun.x + irandom_range(-5, 5);
    y = hitstun.y + irandom_range(-5, 5);
    hitstun.time--;
    
    if (instance_exists(obj_fadeout))
    {
        hitstun.time = 0;
        x = hitstun.x;
        y = hitstun.y;
        hitstun.is = false;
    }
}
else
{
    x = hitstun.x;
    y = hitstun.y;
    hitstun.is = false;
}

for (var i = 0; i < 5; i++)
{
    if (global.toppins[i]) &&  obj_player.character != chars.milton
    {
        if (!instance_exists(toppingstr[i]))
            instance_create(x, y, toppingstr[i]);
    }
    else if (instance_exists(toppingstr[i]))
    {
        instance_destroy(toppingstr[i]);
    }
}
