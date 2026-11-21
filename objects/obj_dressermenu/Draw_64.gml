draw_set_alpha(onlrp * 0.5);
var col = global.DarkMode ? c_black : c_white
draw_rectangle_colour(0, lerp(270, 0, onlrp), 960, lerp(270, 540, onlrp), col, col,col, col, false);
draw_set_alpha(1);
var _sl1 = (selectthinglrp >= 0.5) ? oldoldSelect : select;
var _sl2 = abs(selectthinglrp - 0.5) * 2;
var xx = 0;
var yy = 0;
var hh = sprite_get_height(spr_pal[_sl1]);

for (var i = 1; i < count_pal[_sl1]; i++)
{
    pal_swap_set(spr_pal[_sl1], i, false);
    draw_sprite_stretched(global.PlayerCharacters[_sl1].sprites.player.palettepreview, i - 1, 34 + (xx * _sl2), lerp(270, 34 + yy, onlrp) + ((1 - _sl2) * 46), 46 * (1 + ((1 - _sl2) * 2)), 46 * onlrp * _sl2);
    shader_reset();
    draw_sprite_stretched(spr_dressermenu_panel, select_pal[select] == i, 32 + (xx * _sl2), lerp(270, 32 + yy, onlrp) + ((1 - _sl2) * 50), 50 * (1 + ((1 - _sl2) * 2)), 50 * onlrp * _sl2);
    xx += 64;
    
    if (xx == 256)
    {
        xx = 0;
        yy += 64;
    }
}

var _x = 690;
var _y = 270;

var _p = function(arg0, arg1)
{
    var _s = (select + arg0 + select_count) % select_count;
    
    if (_s >= 0 && _s < select_count)
    {
        var _sc = max(0, 2 - (abs(arg1) / 175));
        arg1 = sin(arg1 / 100) * 100;
        
        if (_sc > 0.05)
        {
            var _f = (_s == UnknownEnum.Value_8) ? clamp(select_pal[_s] - 1, 0, sprite_get_width(spr_playersoda_idle) - 1) : -1;
            var _t = global.PlayerCharacters[_s].sprites.player.idle;
            
            if (_sc > 0.35)
            {
                gpu_set_fog(true, merge_colour(c_white, c_aqua, max(0, _sc - 1)), 0, 0);
                draw_sprite_ext(_t, _f, 690 + _sc, 270 + (arg1 * onlrp), _sc, _sc * onlrp, 0, c_white, 1);
                draw_sprite_ext(_t, _f, 690 - _sc, 270 + (arg1 * onlrp), _sc, _sc * onlrp, 0, c_white, 1);
                draw_sprite_ext(_t, _f, 690, 270 + ((arg1 + _sc) * onlrp), _sc, _sc * onlrp, 0, c_white, 1);
                draw_sprite_ext(_t, _f, 690, 270 + ((arg1 - _sc) * onlrp), _sc, _sc * onlrp, 0, c_white, 1);
                gpu_set_fog(false, c_white, 0, 0);
            }
            
            pal_swap_set(global.PlayerCharacters[_s].sprites.player.palette, select_pal[_s], false);
            draw_sprite_ext(_t, _f, 690, 270 + (arg1 * onlrp), _sc, _sc * onlrp, 0, c_white, 1);
            shader_reset();
            
            if (_sc > 0.35)
                pattern_draw(_t, _f, 690, 270 + (arg1 * onlrp), _sc, _sc * onlrp, 0, 16777215, 1, global.PlayerCharacters[_s].sprites.player.pattern, global.PlayerCharacters[_s].sprites.player.patcolours, global.PlayerCharacters[_s].sprites.player.palette, select_pal[_s]);
            
            draw_sprite_ext(_t, _f, 690, 270 + (arg1 * onlrp), _sc, _sc * onlrp, 0, c_black, (2 - _sc) / 2);
        }
    }
};

_p(2, 350 + selectadd);
_p(1, 175 + selectadd);
_p(-1, -175 + selectadd);
_p(-2, -350 + selectadd);
_p(0, selectadd);
draw_set_font(global.smallfont);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
var _n = string_lower(global.PlayerCharacters[_sl1].name);

if (_sl1 == UnknownEnum.Value_8)
{
    switch (clamp(select_pal[_sl1] - 1, 0, sprite_get_width(spr_playersoda_idle) - 1))
    {
        case 1:
            _n += " : liquor";
            break;
        
        case 2:
            _n += " : ludicrous";
            break;
        
        case 3:
            _n += " : pbsb";
            break;
        
        case 4:
            _n += " : burger";
            break;
        
        case 5:
            _n += " : bacon prime";
            break;
			        case 6:
            _n += " : fries4";
            break;
    }
}

draw_text_transformed(_x - 100, 270, _n, 1, onlrp * _sl2, 0);
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
