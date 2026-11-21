if (global.hide_hud)
    exit;

if (totemAlpha > 0)
{
    draw_set_alpha(totemAlpha);
    draw_sprite(spr_totems, totemIndex, 96, 448);
    draw_set_font(global.creditsfont);
    draw_set_halign(fa_center);
    draw_textEX(96, 376, string("[wave2]{0}/{1}!", itemsCur, itemsMax));
    draw_set_alpha(1);
}
