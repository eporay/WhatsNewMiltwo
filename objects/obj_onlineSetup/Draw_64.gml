var _sel = bgs[bgssel];
var _sell = array_length(_sel);

for (var i = 0; i < _sell; i++)
{
    var _div = _sell - i;
    _div = max(1, _div * _div);
    draw_sprite_tiled(_sel[i], 0, -bgx / _div, 0);
}

draw_set_alpha(bgsfade);
draw_rectangle_colour(0, 0, 960, 540, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_font(global.creditsfont);
if (menu == 0)
{

    var xx = 480;
    var opt = menus[currentmenu];
    var yy = 270 - (48 * (array_length(opt) - 2));
        var xx = 64;
    var yy = 270 - (48 * (array_length(opt) - 2));
    var xs = xx;
    var ys = yy;
    for (var i = 0; i < array_length(opt); i++)
    {
		
        var q = opt[i];
        /*var _col = (selected == i) ? 16777215 : 8421504;
        draw_set_font(global.creditsfont);
        draw_set_colour(_col);
        draw_set_halign(fa_center);
        draw_textEX(xx, yy, q[1]);*/
		var _amt = max(1 - abs(selectedlrp - i), 0);

        
        if (_amt > 0)
        {
            xx = xs + lerp(-48, -8 + (sin(current_time / 100) * 8), _amt);
            yy = ys + (i * 48);
            draw_set_alpha(_amt);
            draw_set_colour(c_aqua);
            draw_rectangle_colour(xx, yy, xx + string_width("("), yy + string_height("("), c_black, c_black, c_black, c_black, false);
            draw_text(xx, yy, "(");
            draw_set_alpha(1);
        }
        
        xx = xs + (sin((i * 1.33) + (current_time / 400)) * 3) + lerp(0, 32, _amt);
        yy = ys + (i * 48) + (cos((i * 1.33) + (current_time / 400)) * 3);
        draw_rectangle_colour(xx, yy, xx + string_width(q[1]), yy + string_height(q[1]), c_black, c_black, c_black, c_black, false);
        draw_set_colour((selected == i) ? c_aqua : c_white);
		draw_text(xx, yy, q[1]);
        yy += 48;
    }
	draw_set_font(global.smallfont);
	draw_set_halign(fa_center);
	draw_set_colour(c_white);

	draw_textEX(480, 540 - 64, string_concat("[wave2]", desc[selected]))
}

draw_set_font(global.creditsfont);
draw_set_halign(fa_center);

if (menu == 1)
{
    draw_textEX(480, 270, "[wave2]Enter the IP");
    draw_textEX(480, 302, $"[wave2]{textInput}");
}

if (menu == 2)
{
    draw_textEX(480, 270, "[wave2]Enter the Port");
    draw_textEX(480, 302, $"[wave2]{textInput}");
}

draw_set_colour(c_white);
