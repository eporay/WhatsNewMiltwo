if (floor(global.racemode.timer) >= 0)
{
    draw_set_font(global.creditsfont);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
    draw_set_colour(c_white);
    var _t = ceil(global.racemode.timer);
    
    if (_t >= 5)
        draw_textEX(480 , 458, _t - 4);
    else if (_t >= 2)
        draw_textEX(480 , 458,  "[shake]GO!");
    
    draw_set_halign(fa_left);
}
