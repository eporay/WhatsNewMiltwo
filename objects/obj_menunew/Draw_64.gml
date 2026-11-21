if (instance_exists(obj_option))
    exit;

if (state == "tv" || state == "select")
{
    draw_surface(surf, 0, 0);
}
else
{
    shader_sset(shd_menunew);
    shader_set_uniform_i(shd1, shdl);
    shader_set_uniform_f_array(shd2, shda);
    draw_surface(surf, 0, 0);
    shader_reset();
}

draw_set_font(global.creditsfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (state == "files")
{
    draw_sprite(spr_minilogo, 0, 866 + (sin(current_time / 777) * 4), 483 + (cos(current_time / 777) * 4));
    draw_textEX(25, 429, lang_get_phrase("menunew_files_controltip1"));
    draw_textEX(25, 461, lang_get_phrase("menunew_files_controltip2"));
    draw_textEX(25, 493, lang_get_phrase("menunew_files_controltip3"));
	var a = 1;
var _g = ""
if date_get_day(GM_build_date) < 10
_g = "0"
var _d = ""
if date_get_month(GM_build_date) < 10
_d = "0"
var _ver = $"{_d}{date_get_month(GM_build_date)}.{_g}{date_get_day(GM_build_date)}.{date_get_year(GM_build_date)}"
draw_set_font(global.smallfont);
draw_textEX(866 - 150, 483 - 50, "build date: " + _ver);
draw_set_font(global.creditsfont);
}
else if (state == "draw")
{
    draw_textEX(25, 429, lang_get_phrase("menunew_draw_controltip1"));
    draw_textEX(25, 461, lang_get_phrase("menunew_draw_controltip2"));
    draw_textEX(25, 493, lang_get_phrase("menunew_draw_controltip3"));
}
else if (state == "tv")
{
    draw_textEX(25, 493, lang_get_phrase("menunew_tv_controltip1"));
}

if (state == "files")
    event_user(0);
else if (state == "draw")
    event_user(1);
else if (state == "tv")

    event_user(2);
	else if (state == "select")
    event_user(3);
if (fadestage >= 0 && fadestage < 2)
{
    fadestage += 0.0625;
    
    if (fadestage == 1)
    {
        if (state == "tv")
            video_close();
        
        if (state == "draw" && surface_exists(drawsurf))
            surface_free(drawsurf);
        
        state = fadestate;
    }
    
    draw_set_alpha((fadestage > 1) ? (1 - (fadestage - 1)) : fadestage);
    draw_rectangle_colour(0, 0, 960, 540, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
}
else
{
    fadestage = -1;
}
fmod_studio_event_instance_set_paused(music,state == "tv");