if (!ds_list_empty(afterimages))
{
    for (var i = 0; i < ds_list_size(afterimages); i++)
    {
        var q = afterimages[| i];
        
        with (q)
        {
            var _shd = false;
            var _blend = 16777215;
            
            switch (type)
            {
                case UnknownEnum.Value_0:
                    _blend = image_blend;
                    break;
                
                case UnknownEnum.Value_1:
                    pal_swap_set(obj_player.spr_palette, obj_player.palIndex, false);
                    _blend = image_blend;
                    _shd = true;
                    break;
                
                case UnknownEnum.Value_2:
                    var _col = 16071083;
                    var _col2 = 16749804;
					if obj_player.character = 12
					{
						                    var _col = #003881;
                    var _col2 = #4e90e7
					}
                    var col = [color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255];
                    var col2 = [color_get_red(_col2) / 255, color_get_green(_col2) / 255, color_get_blue(_col2) / 255];
                    shader_sset(shd_fullshade);
                    shader_set_uniform_f_array(other.uniformLight, [col[0], col[1], col[2]]);
                    shader_set_uniform_f_array(other.uniformDark, [col2[0], col2[1], col2[2]]);
                    _shd = true;
                    break;
                
                case UnknownEnum.Value_5:
                    var _col2 = merge_colour(image_blend, c_black, 0.5);
                    var _col = image_blend;
                    var col = [color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255];
                    var col2 = [color_get_red(_col2) / 255, color_get_green(_col2) / 255, color_get_blue(_col2) / 255];
                    shader_sset(shd_fullshade);
                    shader_set_uniform_f_array(other.uniformLight, [col[0], col[1], col[2]]);
                    shader_set_uniform_f_array(other.uniformDark, [col2[0], col2[1], col2[2]]);
                    _shd = true;
                    break;
                
                case UnknownEnum.Value_4:
                    var _col2 = selectcolor2;
                    var _col = selectcolor;
                    var col = [color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255];
                    var col2 = [color_get_red(_col2) / 255, color_get_green(_col2) / 255, color_get_blue(_col2) / 255];
                    shader_sset(shd_fullshade);
                    shader_set_uniform_f_array(other.uniformLight, [col[0], col[1], col[2]]);
                    shader_set_uniform_f_array(other.uniformDark, [col2[0], col2[1], col2[2]]);
                    _shd = true;
                    break;
                
                case UnknownEnum.Value_3:
                    var _col = 16736352;
                    var _col2 = 9580846;
                    var col = [color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255];
                    var col2 = [color_get_red(_col2) / 255, color_get_green(_col2) / 255, color_get_blue(_col2) / 255];
                    shader_sset(shd_fullshade);
                    shader_set_uniform_f_array(other.uniformLight, [col[0], col[1], col[2]]);
                    shader_set_uniform_f_array(other.uniformDark, [col2[0], col2[1], col2[2]]);
                    _shd = true;
                    break;
                
                case UnknownEnum.Value_6:
                    shader_sset(shd_fullshade);
                    shader_set_uniform_f_array(other.uniformLight, [0.9725490196078431, 0.47058823529411764, 0.6901960784313725]);
                    shader_set_uniform_f_array(other.uniformDark, [0.9098039215686274, 0.3137254901960784, 0.596078431372549]);
                    _shd = true;
                    alpha = 1;
                    fadeoutAlpha = 1;
                    break;
                
                case UnknownEnum.Value_7:
                    var col = [color_get_red(image_blend) / 255, color_get_green(image_blend) / 255, color_get_blue(image_blend) / 255];
                    shader_sset(shd_fullshade);
                    shader_set_uniform_f_array(other.uniformLight, [col[0], col[1], col[2]]);
                    shader_set_uniform_f_array(other.uniformDark, [col[0] - 0.3, col[1] - 0.3, col[2] - 0.3]);
                    _shd = true;
                    alpha = 1;
                    fadeoutAlpha = 1;
                    break;
                
                case UnknownEnum.Value_8:
                    var col = [0.6470588235294118, 0.2549019607843137, 1];
                    shader_sset(shd_fullshade);
                    shader_set_uniform_f_array(other.uniformLight, [col[0], col[1], col[2]]);
                    shader_set_uniform_f_array(other.uniformDark, [1, 1, 1]);
                    _shd = true;
                    alpha = 0.55;
                    fadeoutAlpha = 1;
                    break;
                
                case UnknownEnum.Value_9:
                    var col = [0.9725490196078431, 0.8784313725490196, 0.5019607843137255];
                    var col2 = [0.8470588235294118, 0.5333333333333333, 0.09411764705882353];
                    shader_sset(shd_fullshade);
                    shader_set_uniform_f_array(other.uniformLight, [col[0], col[1], col[2]]);
                    shader_set_uniform_f_array(other.uniformDark, [col2[0], col2[1], col2[2]]);
                    _shd = true;
                    alpha = 0.55;
                    fadeoutAlpha = 1;
                    break;
            }
            
            if (visible)
                draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, _blend, image_alpha * alpha * fadeoutAlpha);
            
            if (_shd)
                shader_reset();
        }
    }
}
