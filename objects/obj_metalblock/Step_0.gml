with (obj_player)
{
    var _block = other;
    var _milton = state = global.states.superjump || sprite_index == spr_milton_longjump || sprite_index == spr_milton_longjumpend || (state == global.states.tumble && sprite_index != sprites.dive && movespeed >= 12 && character == UnknownEnum.Value_2) || (state == global.states.tumble && sprite_index == sprites.dive && character == UnknownEnum.Value_2) || state == global.states.hammerattack || state == global.states.hammerwirl;
    
    if (_milton || state == global.states.dreamcrusher || state = global.states.jaronalaunch||((state =  global.states.skateboardramp || state =  global.states.skateboardmove ) && character = 11 )|| state == global.states.mach3 || state == global.states.buzzsaw || state == global.states.groundpound)
    {
        var _y = y;
        var _x = x + (xscale * 5);
        
        if (_milton || state = global.states.jaronalaunch)
        {
            _y = y + vsp;
            _x = x + hsp;
        }
        
        if (state == global.states.dreamcrusher || state == global.states.groundpound)
        {
            _y = y + vsp;
            _x = x;
        }
        
        if (state == global.states.buzzsaw)
        {
            _y = y + vsp;
            _x = x + (xscale * 5);
        }
        
        if (place_meeting(_x, _y, _block) || ((state == global.states.dreamcrusher || state == global.states.groundpound) && place_meeting(_x, y + 1, _block)) || (state == global.states.superjump && place_meeting(_x, y - 1, _block)))
        {
            with (_block)
                instance_destroy();
            if character != 11
			{
            if ((state == global.states.dreamcrusher && character != 10) || state == global.states.groundpound)
            {
                sprite_index = sprites.groundpoundland;
                image_index = 0;
                vsp = 0;
                hsp = 0;
                state = global.states.freefallland;
                movespeed = abs(hsp);
                plrsnds_play(sfx.slam, x, y);
            }
			}
        }
    }
}
