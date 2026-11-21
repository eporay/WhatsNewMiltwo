if (!is_transfo_all(obj_player.state) && obj_player.character != 11)
{
    instance_destroy();
    exit;
}

var pl = obj_player.id;
if pl.character != 11
draw_healthbar(pl.x - 64, pl.y - 64, (pl.x - 64) + 12, (pl.y - 64) + 12, (pl.sprayCans / 4) * 100, c_black, c_white, c_white, 3, true, false);
var _thing = pl.state == global.states.skateboardAim;
image_yscale = lerp(image_yscale, _thing, 0.2);
image_yscale = approach(image_yscale, _thing, 0.002);

if (_thing)
{
    var _vert = global.pky_up;

    var _horiz = global.pky_right + global.pky_left;
    
    if (_horiz != 0)
        image_xscale = _horiz;
    
    _horiz = _horiz != 0;
    image_index = _horiz ? _vert : 2;

    image_angle = clamp(image_angle + 1, 0, 80);
}
else
{
    image_angle = 0;
}

image_blend = lerp(image_blend, image_angle, 0.15);
var _wait = image_blend / #500000;

if (image_yscale > 0)
    draw_sprite_ext(sprite_index, image_index, pl.x + (random_range(-4, 4) * _wait), pl.y + (random_range(-4, 4) * _wait), image_xscale * image_yscale, image_yscale, 0, merge_colour(c_white, c_red, _wait), 1);
