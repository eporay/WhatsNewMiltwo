if (mousemoved)
{
    hand_x = lerp(hand_x, clamp(mouse_x, 0, 960) - 135, 0.5);
    hand_y = lerp(hand_y, clamp(clamp(mouse_y, 0, 540) - 20, 0, 540), 0.5);
    mouse_xfake = mouse_x;
    mouse_yfake = mouse_y;
    
    if (global.pky_right || -global.pky_left || global.pky_up || global.pky_down || global.pky_jump || global.pky_grab)
        mousemoved = false;
}
else
{
    hand_x = lerp(hand_x, clamp(mouse_xfake, 0, 960) - 135, 0.5);
    hand_y = lerp(hand_y, clamp(mouse_yfake, 0, 540) - 20, 0.5);
}

var mbleft = global.pky_jump || mouse_check_button(mb_left);
var mbright = !mbleft && (global.pky_grab || mouse_check_button(mb_right));
hand_hover = mbright ? 2 : (mbleft ? 4 : 1);

if (global.pky_start2)
{
    fadestage = 0;
    fadestate = "files";
}
