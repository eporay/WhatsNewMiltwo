if (instance_exists(obj_option))
    exit;



if (light_timer-- < 0)
{
    light_final = lerp(light_final, random_range(-0.01, 0.01) + 0.225, 0.5);
    light_timer = 1;
}

mouse_xspd = lerp(mouse_xspd, global.mky_right + global.mky_left, 0.2);
mouse_yspd = lerp(mouse_yspd, global.mky_down - global.mky_up, 0.2);
mouse_xfake += (mouse_xspd * 12);
mouse_yfake += (mouse_yspd * 12);
mouse_xfake = clamp(mouse_xfake, 0, 960);
mouse_yfake = clamp(mouse_yfake, 0, 540);

if (window_mouse_get_delta_x() > 0 || window_mouse_get_delta_y() > 0)
    mousemoved = true;

hand_y = clamp(hand_y, 0, 540);

if (state == "files")
{
    for (var i = 0; i < array_length(items); i++)
    {
        var _q = items[i];
        draw_sprite_ext(spr_menunew, _q.index, _q.x + _q.xdraw, _q.y + _q.ydraw, 1, 1, (_q.type == "drawer") ? (_q.x / 4) : 0, c_white, 1);
    }
    
    draw_sprite(spr_menunew, 2, 0, 0);
}

if (state == "draw")
{
    var mbleft = global.mky_jump || mouse_check_button(mb_left);
    var mbright = global.mky_slap || mouse_check_button(mb_right);
    var _offset = 132;
    draw_sprite(spr_menunew, 10, 0, 0);
    
    if (!surface_exists(drawsurf))
    {
        drawsurf = surface_create(960 - (_offset * 2), 540);
        surface_set_target(drawsurf);
        draw_clear(#5860AA);
        draw_sprite(spr_menunew, 11, 0, 0);
        surface_reset_target();
    }
    
    surface_set_target(drawsurf);
    
    if (mbleft)
    {
        draw_line_width_colour((hand_x_old - _offset) + 135, hand_y_old + 20, (hand_x - _offset) + 135, hand_y + 20, 2, #3C1E3E, #3C1E3E);
    }
    else if (mbright)
    {
        draw_circle_colour((hand_x_old - _offset) + 135, hand_y_old + 20, 64, #5860AA, #5860AA, false);
        draw_circle_colour((hand_x - _offset) + 135, hand_y + 20, 64, #5860AA, #5860AA, false);
        draw_line_width_colour((hand_x_old - _offset) + 135, hand_y_old + 20, (hand_x - _offset) + 135, hand_y + 20, 64, #5860AA, #5860AA);
    }
    
    surface_reset_target();
    draw_surface(drawsurf, _offset, 0);
    draw_circle_colour(hand_x + 135, hand_y + 20, 64, #3C1E3E, #3C1E3E, true);
    draw_circle_colour(hand_x + 135, hand_y + 20, 2, #3C1E3E, #3C1E3E, true);
}

hand_x_old = hand_x;
hand_y_old = hand_y;
