if (currentRoom == room)
{
	depth = 1;
    if (!sprite_exists(sprite_index))
	{
		draw_text_transformed(xlerp, ylerp , "my sprite dosnt exist", global.modifiers.flipped ? -1 : 1, 1, 0);
		
        exit;
	}
    
    if (object >= 0)
    {
        draw_sprite_ext(sprite_index, image_index, xlerp + global.prophuntmode.sprites[object][2], ylerp + global.prophuntmode.sprites[object][3], global.prophuntmode.sprites[object][4] ? xscale : 1, 1, 0, c_white, 1);
        exit;
    }
    
    draw_sprite_ext(sprite_index, image_index, xlerp, ylerp, xscale, 1, image_angle, image_blend, alpha);
    pal_swap_set(spr_palette, palIndex, false);
    draw_sprite_ext(sprite_index, image_index, xlerp, ylerp, xscale, 1, image_angle, image_blend, alpha);
    shader_reset();
    pattern_draw(sprite_index, image_index, xlerp, ylerp, xscale, 1, image_angle, image_blend, alpha, spr_pattern, spr_playerPatCol, spr_palette, palIndex);
    if state = global.states.jaronalaunch 
{
	 var _col2 = #2e3192;
                    var _col = #6060ff;
                    var col = [color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255];
                    var col2 = [color_get_red(_col2) / 255, color_get_green(_col2) / 255, color_get_blue(_col2) / 255];
                    shader_sset(shd_fullshade);
                    shader_set_uniform_f_array(other.uniformLight, [col[0], col[1], col[2]]);
                    shader_set_uniform_f_array(other.uniformDark, [col2[0], col2[1], col2[2]]);
					draw_sprite_ext(sprite_index, image_index, xlerp, ylerp, xscale, 1, image_angle, image_blend, alpha);
					shader_reset()
}
    if (flash)
    {
        shader_sset(shd_silo);
        draw_sprite_ext(sprite_index, image_index, xlerp, ylerp, xscale, 1, image_angle, image_blend, alpha);
        shader_reset();
    }
    
    draw_set_font(global.smallfont);
    var _c = hunter ? 255 : 16777215;
    var _hash = 0;
    
    if (!hunter)
    {
        for (var i = 1; i <= string_length(name); i++)
            _hash = ((_hash * 31) + ord(string_char_at(name, i))) % 16777216;
        
        _c = make_color_hsv(_hash % 256, 60 + (floor(_hash / 256) % 63), 255);
    }
    
    draw_set_colour(_c);
    draw_set_halign(fa_center);
    draw_text_transformed(xlerp, (ylerp + ylerpname) - 72, string_lower(name), global.modifiers.flipped ? -1 : 1, 1, 0);
    draw_set_colour(c_white);
    draw_set_halign(fa_left);
}
