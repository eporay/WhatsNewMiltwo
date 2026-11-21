with (obj_player)
{
	if spectateID != -4
	{
		    draw_set_halign(fa_center);
			 draw_set_valign(fa_center);
		    draw_set_font(global.creditsfont);
			draw_textEX(480 + irandom_range(1, -1), 32, string_concat("Currently spectating ", spectateID.name) )
			draw_set_alpha(sprite_index = sprites.spectate ? 0.5 : 1)
			draw_textEX(480 + irandom_range(1, -1), 540 - 64, "[J] to stop")
			draw_set_alpha(1)
			draw_set_valign(-1);
	}
}
if (array_length(notifs) > 0)
{
    draw_set_font(-1);
    draw_set_halign(fa_left);
    var _y = 16;
    var i = array_length(notifs) - 1;
    
    while (i >= 0)
    {
        notifs[i][1]--;
        
        if (notifs[i][1] <= 1)
        {
            array_delete(notifs, i, 1);
        }
        else
        {
            _y += 16;
            draw_set_alpha(clamp((notifs[i][1] * notifs[i][1] * notifs[i][1]) / 20000, 0, 1));
            draw_set_colour(c_black);
            draw_rectangle(13, 540 - _y - 3, 19 + string_width(notifs[i][0]), (540 - _y) + 3 + string_height(notifs[i][0]), false);
        }
        
        i--;
    }
    
    _y = 16;
    i = array_length(notifs) - 1;
    
    while (i >= 0)
    {
        if (notifs[i][1] > 1)
        {
            _y += 16;
            draw_set_alpha(clamp((notifs[i][1] * notifs[i][1] * notifs[i][1]) / 20000, 0, 1));
            draw_set_colour(notifs[i][2]);
            draw_textEX(16, 540 - _y, notifs[i][0]);
        }
        
        i--;
    }
    
    draw_set_colour(c_white);
    draw_set_alpha(1);
}

if (keyboard_check(vk_tab))
{
    var _arr = [[-4, global.username]];
    var sockets = ds_map_values_to_array(plrsconnected);
    array_copy(_arr, 1, sockets, 0, array_length(sockets));
    draw_set_alpha(0.5);
    draw_set_colour(c_black);
    draw_rectangle(8, 8, 480, 28 + (array_length(_arr) * 16), false);
    draw_set_font(global.smallfont);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
    var _y = 18;
    
    for (var i = 0; i < array_length(_arr); i++)
    {
        var _text = _arr[i][1];
        var _c = 16777215;
        var _hash = 0;
        
        for (var j = 1; j <= string_length(_text); j++)
            _hash = ((_hash * 31) + ord(string_char_at(_text, j))) % 16777216;
        
        _c = make_color_hsv(_hash % 256, 60 + (floor(_hash / 256) % 63), 255);
        draw_set_colour(_c);
        draw_text(16, _y, string_lower(_text));
        _y += 16;
    }
    
    draw_set_colour(c_white);
}
