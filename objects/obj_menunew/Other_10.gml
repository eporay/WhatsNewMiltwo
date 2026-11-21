if (mousemoved)
{
    hand_x = lerp(hand_x, clamp(mouse_x, 0, 960) - 150, 0.2);
    hand_y = lerp(hand_y, clamp(clamp(mouse_y, 0, 540) - 50, 0, 540), 0.2);
    mouse_xfake = mouse_x;
    mouse_yfake = mouse_y - 50;
    
    if (global.pky_right || -global.pky_left || global.pky_up || global.pky_down || global.pky_jump || global.pky_grab)
        mousemoved = false;
}
else
{
    hand_x = lerp(hand_x, clamp(mouse_xfake, 0, 960) - 150, 0.2);
    hand_y = lerp(hand_y, clamp(mouse_yfake, 0, 540), 0.2);
}

var mbleft = global.pky_jump || mouse_check_button(mb_left);
var mbright = !mbleft && (global.pky_grab || mouse_check_button(mb_right));
var _maxy = 205;
var _rangex = mbright ? 150 : 48;
var _rangey = mbright ? 1000 : 40;
var _tvquestionmarrrkkk = hand_x > 428 && hand_x < 724 && hand_y < 96;
var _drawingquestionmarrrkkk = hand_x > 7 && hand_x < 103 && hand_y < 96;

var _hover = -1;
for (var i = 0; i < array_length(items); i++)
{
    var _q = items[i];
    
    if (_q.type == "drawer")
    {
        if (abs(hand_x - _q.xdraw - 40) < (mbright ? 150 : 48) && abs(hand_y - _q.y - 210) < (mbright ? 1000 : 40))
            _hover = i;
        
        if (hand_grab == i)
        {
            hand_x = lerp(hand_x, _q.xdraw + 35, 0.95);
            _q.x = (hand_x - _q.xdraw - 35) * 0.5;
            _q.y -= hand_y_old - hand_y;
            _q.y = lerp(_q.y, clamp(_q.y, 0, 205), 0.8);
            hand_y = lerp(hand_y, _q.y + 205, 0.8);
        }
        else
        {
            _q.y += _q.vsp;
            _q.vsp = approach(_q.vsp, 0, 0.5);
            
            if (_q.y < 0)
            {
                if (abs(_q.vsp) > 5)
                    FMODevent_oneshot("event:/Sfx/Player/mach2bump", 480, 270);
                
                _q.vsp *= -0.3;
                _q.y = lerp(_q.y, 0, 0.1 - (_q.y / 64));
            }
            else if (_q.y > 205)
            {
                if (abs(_q.vsp) > 5)
                    FMODevent_oneshot("event:/Sfx/Player/mach2bump", 480, 270);
                
                _q.vsp *= -0.3;
                _q.y = lerp(_q.y, 205, 0.1 + ((_q.y - 205) / 64));
            }
            
            _q.x = lerp(_q.x, 0, 0.25);
        }
    }
    else if (_q.type == "disc")
    {
        var _q2 = items[_q.link];
        _q.x = _q2.x + _q2.xdraw;
        _q.y = _q2.y;
        
        if (_q.y > 100 && abs(hand_x - _q.xdraw - _q.x - 40) < 48 && abs(hand_y - _q.ydraw - _q.y - 70) < 48)
            _hover = i;
    }
}
if (mbright)
{
    if (hand_hover != 3)
    {
        hand_x += random_range(-48, 48);
        hand_y += random_range(-48, 48);
        
        if (hand_y > 170 && hand_y < 470 && _hover >= 0 && items[_hover].type == "drawer")
        {
            items[_hover].vsp = -random_range(20, 100);
            FMODevent_oneshot("event:/Sfx/General/Enemy/killenemy", 480, 270);
            FMODevent_oneshot("event:/Sfx/Player/punch", 480, 270);
            create_particleStatic(spr_bangeffect, hand_x + 150, hand_y + 50, 1, depth - 1);
        }
        
        create_particleStatic(spr_hurteffect, hand_x + 150, hand_y + 50, 1, depth - 1);
        FMODevent_oneshot("event:/Sfx/Player/bump", 480, 270);
    }
    
    hand_x += random_range(-2, 2);
    hand_y += random_range(-2, 2);
    hand_hover = 3;
}
else if (_tvquestionmarrrkkk)
{
    hand_hover = 4;
    
    if (mbleft)
    {
        fadestage = 0;
        fadestate = "tv";
    }
}
else if (_drawingquestionmarrrkkk)
{
    hand_hover = 4;
    
    if (mbleft)
    {
        fadestage = 0;
        fadestate = "draw";
    }
}
else if (_hover >= 0)
{
    hand_hover = (items[_hover].type == "disc") ? 4 : 1;
}
else
{
    hand_hover = 0;
}

/*if (hand_grab == 1)
{
    hand_x = lerp(hand_x, 35, 0.95);
    drawer1_x = (hand_x - 35) * 0.5;
    drawer1_y -= (hand_y_old - hand_y);
    drawer1_y = lerp(drawer1_y, clamp(drawer1_y, 0, _maxy), 0.8);
    hand_y = lerp(hand_y, drawer1_y + _maxy, 0.8);
}
else
{
    drawer1_y += drawer1_vsp;
    drawer1_vsp = approach(drawer1_vsp, 0, 0.5);
    
    if (drawer1_y < 0)
    {
        if (abs(drawer1_vsp) > 5)
            FMODevent_oneshot("event:/Sfx/Player/mach2bump", 480, 270);
        
        drawer1_vsp *= -0.3;
        drawer1_y = lerp(drawer1_y, 0, 0.1 - (drawer1_y / 64));
    }
    else if (drawer1_y > _maxy)
    {
        if (abs(drawer1_vsp) > 5)
            FMODevent_oneshot("event:/Sfx/Player/mach2bump", 480, 270);
        
        drawer1_vsp *= -0.3;
        drawer1_y = lerp(drawer1_y, _maxy, 0.1 + ((drawer1_y - _maxy) / 64));
    }
    
    drawer1_x = lerp(drawer1_x, 0, 0.25);
}

if (hand_grab == 2)
{
    hand_x = lerp(hand_x, 335, 0.95);
    drawer2_x = (hand_x - 335) * 0.5;
    drawer2_y -= (hand_y_old - hand_y);
    drawer2_y = lerp(drawer2_y, clamp(drawer2_y, 0, _maxy), 0.8);
    hand_y = lerp(hand_y, drawer2_y + _maxy, 0.8);
}
else
{
    drawer2_y += drawer2_vsp;
    drawer2_vsp = approach(drawer2_vsp, 0, 0.5);
    
    if (drawer2_y < 0)
    {
        if (abs(drawer2_vsp) > 5)
            FMODevent_oneshot("event:/Sfx/Player/mach2bump", 480, 270);
        
        drawer2_vsp *= -0.3;
        drawer2_y = lerp(drawer2_y, 0, 0.1 - (drawer2_y / 64));
    }
    else if (drawer2_y > _maxy)
    {
        if (abs(drawer2_vsp) > 5)
            FMODevent_oneshot("event:/Sfx/Player/mach2bump", 480, 270);
        
        drawer2_vsp *= -0.3;
        drawer2_y = lerp(drawer2_y, _maxy, 0.1 + ((drawer2_y - _maxy) / 64));
    }
    
    drawer2_x = lerp(drawer2_x, 0, 0.25);
}

if (hand_grab == 3)
{
    hand_x = lerp(hand_x, 635, 0.95);
    drawer3_x = (hand_x - 635) * 0.5;
    drawer3_y -= (hand_y_old - hand_y);
    drawer3_y = lerp(drawer3_y, clamp(drawer3_y, 0, _maxy), 0.8);
    hand_y = lerp(hand_y, drawer3_y + _maxy, 0.8);
}
else
{
    drawer3_y += drawer3_vsp;
    drawer3_vsp = approach(drawer3_vsp, 0, 0.5);
    
    if (drawer3_y < 0)
    {
        if (abs(drawer3_vsp) > 5)
            FMODevent_oneshot("event:/Sfx/Player/mach2bump", 480, 270);
        
        drawer3_vsp *= -0.3;
        drawer3_y = lerp(drawer3_y, 0, 0.1 - (drawer3_y / 64));
    }
    else if (drawer3_y > _maxy)
    {
        if (abs(drawer3_vsp) > 5)
            FMODevent_oneshot("event:/Sfx/Player/mach2bump", 480, 270);
        
        drawer3_vsp *= -0.3;
        drawer3_y = lerp(drawer3_y, _maxy, 0.1 + ((drawer3_y - _maxy) / 64));
    }
    
    drawer3_x = lerp(drawer3_x, 0, 0.25);
}*/

if (hand_grab != -4)
{
    mouse_xfake = lerp(mouse_xfake, hand_x + 150, 0.1);
    mouse_yfake = lerp(mouse_yfake, hand_y, 0.1);
}

if (mbleft)
{
    if (hand_grab == -4 && _hover >= 0)
    {
        if (items[_hover].type == "disc")
        {
            file = items[_hover].index - 15;
			
            fadestage = 0;
            fadestate = "select";
        }
        else
        {
            FMODevent_oneshot("event:/Sfx/Player/mach2bump", 480, 270);
            FMODevent_oneshot("event:/Sfx/Player/bump", 480, 270);
            hand_grab = _hover;
        }
    }
}
else if (hand_grab != -4)
{
    mouse_xfake = hand_x + 150;
    mouse_yfake = hand_y;
    
    if (items[hand_grab].type == "drawer")
        items[hand_grab].vsp = (hand_y - hand_y_old) / 1.2;
    
    FMODevent_oneshot("event:/Sfx/Player/mach2bump", 480, 270);
    hand_grab = -4;
}

if (global.pky_start2)
    instance_create(0, 0, obj_option);
