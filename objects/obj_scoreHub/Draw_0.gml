draw_sprite(sprite_index, image_index, x, y);
draw_set_font(global.fnt_kettle[obj_player.character]);
draw_set_halign(fa_center);
draw_text(x + 16, y + 12, collect);
draw_set_font(global.smallfont)
if (showRank)
    draw_sprite_ext(spr_hudRanks, rankIndex, x - 15, y + 79, rankScale, rankScale, 0, c_white, 1);
if hasbeaten
{
	draw_set_halign(fa_center)
draw_textEX(x - 5, y + 32 + 5, string_concat(timeString(personalbest)));
draw_set_halign(-1)
}

