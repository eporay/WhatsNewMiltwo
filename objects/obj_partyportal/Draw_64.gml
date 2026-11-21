if obj_player.character = chars.bacon5 
{
	draw_set_font(global.smallfont);
draw_set_alpha(1);
draw_set_colour(c_black);
draw_rectangle(0, 440 + ((y - 170) * 2), 960, 540, false);
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(480, (540 + (440 + ((y - 170) * 2))) / 2, string_lower(st));
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);

}