function create_particleStatic(arg0, arg1, arg2, arg3, arg4 = 1)
{
    return instance_create_depth(arg1, arg2, arg4, obj_particle, 
    {
        sprite_index: arg0,
        image_xscale: arg3
    });
}

function create_particleDebri(arg0, arg1, arg2, arg3, arg4, arg5 = 1, arg6 = random_range(0, 360), arg7 = random_range(-5, 5), arg8 = random_range(10, -10))
{
    var par = create_particleStatic(arg0, arg2, arg3, arg4, arg5);
    
    with (par)
    {
        hsp = arg8;
        vsp = arg7;
        grav = 0.4;
        image_index = arg1;
        image_angle = arg6;
        image_speed = 0;
    }
    
    return par;
}

function create_collect(arg0, arg1, arg2, arg3 = false)
{
    if (arg3 == false)
    {
        arg1 -= camera_get_view_x(view_camera[0]);
        arg2 -= camera_get_view_y(view_camera[0]);
    }
    
    var par = 
    {
        sprite_index: arg0,
        x: arg1,
        y: arg2,
        hsp: 0,
        vsp: 0,
        Hmvsp: 0,
        Vmvsp: 0
    };
    ds_list_add(obj_hud.collectVis, par);
    return par;
}

function create_afterimage(arg0, arg1, arg2, arg3, arg4, arg5 = 1)
{
    var aft = 
    {
        sprite_index: arg0,
        image_index: arg1,
        x: arg2,
        y: arg3,
        image_xscale: arg4,
        image_blend: choose(12603647, 8191824),
        onlineDelay: instance_exists(obj_multiplayerHandler) ? 1 : -1,
        alarm: [15],
        type: UnknownEnum.Value_0,
        alpha: arg5,
        fadeoutAlpha: 1,
        fadeout: false,
        image_alpha: 1,
        visible: true
    };
    
    if (object_index == obj_player && aft.sprite_index == sprite_index)
    {
        var realInfo = playerUtil_realSpr();
        aft.sprite_index = realInfo[0];
        aft.image_index = realInfo[1];
    }
    
    ds_list_add(obj_afterimageSystem.afterimages, aft);
    return aft;
}

function create_buzzsawAfterimage(arg0, arg1, arg2, arg3, arg4, arg5 = 0.8)
{
    var q = create_afterimage(arg0, arg1, arg2, arg3, arg4, arg5);
    q.image_blend = c_white;
    q.type = UnknownEnum.Value_2;
    return q;
}

function create_machEffect(arg0, arg1, arg2, arg3, arg4, arg5 = 0.8)
{
    var q = create_afterimage(arg0, arg1, arg2, arg3, arg4, arg5);
    q.type = UnknownEnum.Value_5;
    
    if (object_index == obj_player && character == UnknownEnum.Value_5)
    {
        q.image_blend = choose(#E4E281, #91BBE4, #00B000);
        q.alarm = [15, 5, -2];
        q.type = UnknownEnum.Value_7;
    }
    else if (object_index == obj_player && character == UnknownEnum.Value_7)
    {
        q.alarm = [15, 5, -2];
        q.type = choose(UnknownEnum.Value_8, UnknownEnum.Value_9);
    }
    
    return q;
}

function create_miltonAfterimage(arg0, arg1, arg2, arg3, arg4, arg5 = 0.8)
{
    var q = create_afterimage(arg0, arg1, arg2, arg3, arg4, arg5);
    q.image_blend = c_white;
    q.type = UnknownEnum.Value_3;
    return q;
}

function create_selectcolorAfterimage(arg0, arg1, arg2, arg3, arg4, arg5 = 0.8, arg6 = 16777215, arg7 = 0)
{
    var q = create_afterimage(arg0, arg1, arg2, arg3, arg4, arg5);
    q.image_blend = c_white;
    q.type = UnknownEnum.Value_4;
    q.selectcolor = arg6;
    q.selectcolor2 = arg7;
    return q;
}

function create_blur_effect(arg0, arg1, arg2, arg3, arg4)
{
    var q = create_afterimage(arg0, arg1, arg2, arg3, arg4, 0.8);
    q.image_blend = c_white;
    q.type = UnknownEnum.Value_1;
    return q;
}

function create_dreamAttack_effect(arg0, arg1, arg2, arg3, arg4)
{
    var q = create_afterimage(arg0, arg1, arg2, arg3, arg4, 0.8);
    q.type = UnknownEnum.Value_6;
    return q;
}
