if (room == initObject)
{
    draw_rectangle_color(0, 0, 1920, 1080, c_black, c_black, c_black, c_black, false);
    draw_sprite(spr_loadingBacon, 1, 480, 270);
    draw_sprite_part(spr_loadingBacon, 0, 0, 0, npprg * 586, 391, 187, 75);
}
/*with (obj_shell)
{
if isOpen
{
	draw_set_halign(fa_middle)
	draw_set_font(global.creditsfont)
	draw_textEX(480, 32, "[wave2nshake]New font is because the decomp.")
}
}