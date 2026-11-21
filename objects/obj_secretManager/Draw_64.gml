if (dudles_text != -4)
{
    draw_set_font(global.smallfont);
    draw_set_alpha(1);
    draw_set_valign(fa_top);
    draw_set_halign(fa_center);
    draw_set_colour(c_white);
    draw_textEX(480, 500, string("dudles left : {0}", dudles_text));
}
