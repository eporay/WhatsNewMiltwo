
draw_clear(c_black);
draw_set_colour(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(global.creditsfont);
draw_set_colour(#FF5327)
draw_textEX(320 - 5, 192 + 5, "[wave2nshake]Whats New");
draw_set_colour(#FFC655)
draw_textEX(320 , 192 , "[wave2nshake]Whats New");

draw_set_colour(c_white)
draw_textEX(480, 32, string_concat("[wave2]Save ", save));
draw_sprite(spr_logo_temp, 0, 480 + irandom_range(-1, 1), 205.2 + irandom_range(-1, 1));

draw_set_valign(fa_top);
var a = 1;
var _g = ""
if date_get_day(GM_build_date) < 10
_g = "0"
var _d = ""
if date_get_month(GM_build_date) < 10
_d = "0"
var _ver = $"{_d}{date_get_month(GM_build_date)}/{_g}{date_get_day(GM_build_date)}/{date_get_year(GM_build_date)}"


draw_textEX(480, 475.2, "[wave][J] to start");
//_ver = ""
draw_textEX(480, 388.8, string("[wave2]{0} Build", _ver));

draw_set_halign(fa_left);
