var realInfo = playerUtil_realSpr();
var _new = character == UnknownEnum.Value_2 || isMildred || character == UnknownEnum.Value_3 || character == UnknownEnum.Value_8 || character = 10

if (super)
{
    for (var i = 0; i < 16; i++)
    {
        var _xx = sin((current_time * 0.001) + (2 * i)) * 2 * i;
        var _yy = cos((current_time * 0.001) + (1 * i)) * 2 * i;
        var _alpha = abs(sin((current_time * 0.001) + (5 * i))) * 0.1;
        gpu_set_blendmode(bm_add);
        draw_sprite_ext(realInfo[0], realInfo[1], x + _xx, y + _yy, xscale * (_new ? squashX : 1) * xscaleMulti, ((1 * _new) ? squashY : 1) * yscaleMulti, angle, c_red, image_alpha * _alpha);
        gpu_set_blendmode_default();
    }
}

pal_swap_set(spr_palette, palIndex, false);
draw_sprite_ext(realInfo[0], realInfo[1], x, y, xscale * (_new ? squashX : 1) * xscaleMulti, ((1 * _new) ? squashY : 1) * yscaleMulti, angle, image_blend, image_alpha);
shader_reset();
squashX = lerp(squashX, 1, 0.25);
squashY = lerp(squashY, 1, 0.25);
pattern_draw(realInfo[0], realInfo[1], x, y, xscale * (_new ? squashX : 1) * yscaleMulti, ((1 * _new) ? squashY : 1) * yscaleMulti, angle, image_blend, image_alpha, global.patternSpr, global.PlayerCharacters[character].patColors);
if state = global.states.jaronalaunch 
{
	 var _col2 = #2e3192;
                    var _col = #6060ff;
                    var col = [color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255];
                    var col2 = [color_get_red(_col2) / 255, color_get_green(_col2) / 255, color_get_blue(_col2) / 255];
                    shader_sset(shd_fullshade);
                    shader_set_uniform_f_array(other.uniformLight, [col[0], col[1], col[2]]);
                    shader_set_uniform_f_array(other.uniformDark, [col2[0], col2[1], col2[2]]);
					draw_sprite_ext(realInfo[0], realInfo[1], x, y, xscale * (_new ? squashX : 1) * xscaleMulti, ((1 * _new) ? squashY : 1) * yscaleMulti, angle, image_blend, image_alpha);
					shader_reset()
}
if (flash)
{
    shader_sset(shd_silo);
    draw_sprite_ext(realInfo[0], realInfo[1], x, y, xscale * (_new ? squashX : 1) * xscaleMulti, ((1 * _new) ? squashY : 1) * yscaleMulti, angle, image_blend, image_alpha);
	
    shader_reset();
}

if (uparrow > 0)
    draw_sprite_ext(spr_uparrow, 0, x, (y + -abs(sin(current_time / 200) * 10)) - lerp(40, 55, uparrow), lerp(0, 1, uparrow), lerp(0, 1, uparrow), lerp(0, 360, uparrow) + (sin(current_time / 200) * 20), c_white, 3 - uparrow);

if (instance_exists(obj_onlineHandler))
{
    var _c = (global.prophuntmode.active && instance_exists(obj_onlineProphunt) && global.prophuntmode.select < 0) ? 255 : 16777215;
    var _hash = 0;
    
    if (_c == 16777215)
    {
        for (var i = 1; i <= string_length(global.username); i++)
            _hash = ((_hash * 31) + ord(string_char_at(global.username, i))) % 16777216;
        
        _c = make_color_hsv(_hash % 256, 60 + (floor(_hash / 256) % 63), 255);
    }
    
    if (sprite_exists(realInfo[0]))
        ylerpname = lerp(ylerpname, sprite_get_bbox_top(realInfo[0]), 0.05);
    
    draw_set_font(global.smallfont);
    draw_set_colour(_c);
    draw_set_halign(fa_center);
    draw_text_transformed(x, (y + ylerpname) - 72, global.username, global.modifiers.flipped ? -1 : 1, 1, 0);
    draw_set_colour(c_white);
    draw_set_halign(fa_left);
}
