function scr_collide_destructibles()
{
    if (state == global.states.jump && vsp < 0)
    {
        if (scr_collide_destructibles_helper(x, y, x, y + (vsp * 1.33)))
            vsp = 0;
    }
    
    if (state == global.states.dreamcrusher || state = global.states.jaronalaunch||state = global.states.coconut_float|| state == global.states.hammerwirl || state == global.states.mach2 || state == global.states.mach3 || state == global.states.grab || state == global.states.tumble || state == global.states.hammerattack || (sprite_index == spr_player_swingading && state == global.states.hauling) || state == global.states.snowball || state == global.states.dreamspin || state == global.states.dreambounce || state == global.states.retwistedBuzzsaw || state == global.states.tumble || state == global.states.groundpound || state == global.states.uppercut || state == global.states.superjump || state == global.states.buzzsaw || state == global.states.climbwall || state == global.states.skateboard || state == global.states.skateboardmove || state == global.states.skateboardwall || state == global.states.skateboardramp || state == global.states.slip || state == global.states.water)
        scr_collide_destructibles_helper(x, y, x + xscale + (hsp * 1.33), y + (vsp * 1.33));
}

function scr_collide_destructibles_helper(arg0, arg1, arg2, arg3)
{
    for (var j = 0; j <= 3; j++)
    {
        var t = j / 3;
        var xx = lerp(arg0, arg2, t);
        var yy = lerp(arg1, arg3, t);
        
        if (place_meeting(xx, yy, obj_destructibles))
        {
            var _list = ds_list_create();
            var _num = instance_place_list(xx, yy, obj_destructibles, _list, false);
            
            if (_num > 0)
            {
                for (var i = 0; i < _num; i++)
                    instance_destroy(_list[| i]);
            }
            
            ds_list_destroy(_list);
            return true;
        }
    }
    
    return false;
}
