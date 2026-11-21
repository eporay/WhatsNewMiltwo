if (!in_camera())
{
    var _x = x - camera_get_view_x(view_camera[0]);
    _x = clamp(_x, 100, 860);
    var _y = y - camera_get_view_y(view_camera[0]);
    _y = clamp(_y, 100, 440);
    draw_sprite(spr_hipnatueseLocator, locatorIndex, _x, _y);
}
