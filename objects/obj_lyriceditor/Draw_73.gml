draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_colour(c_white);
captions.vsp += 0.06;
captions.y2 += captions.vsp;

if (captions.y2 > 0)
{
    captions.y2 = 0;
    captions.vsp *= -0.75;
}

captions.yy = lerp(captions.yy, (captions.toggle * captions.y2 * 0.65) - 35, 0.4);
draw_text(25, 25, curtime / 1000);
draw_line(65, 0, 65, 540);

for (i = 0; i < 5000; i++)
{
    draw_point(((curtime / 1000) * -200) + (i * 40) + 65, 260);
    draw_text(((curtime / 1000) * -200) + (i * 40) + 65, 230, string_delete(string_format((i % 5) / 5, 0, 1), 0, 1));
    
    if ((i % 5) == 0)
        draw_text(((curtime / 1000) * -200) + (i * 40) + 65, 280, i / 5);
}

for (i = 0; i < array_length(captions.timing); i++)
    draw_circle(((curtime / 1000) * -200) + (captions.timing[i] * 200) + 65, 300, 4, false);

var i = array_length(captions.timing) - 1;

while (i >= 0)
{
    if (captions.timing[i] < (curtime / 1000))
    {
        if (captions.old != i)
        {
            captions.toggle = ((i % 2) * -2) + 1;
            captions.vsp = -1.125;
            captions.y2 = 0;
            captions.old = i;
        }
        
        if (captions.str[i] != "")
        {
            draw_set_alpha(0.5);
            draw_set_colour(c_black);
            draw_set_font(-1);
            var _strw = string_width(captions.str[i]);
            var _strh = string_height(captions.str[i]);
            draw_roundrect_ext(480 - (_strw / 2) - 16, (492 + captions.yy) - (_strh / 2) - 16, 480 + (_strw / 2) + 16, 492 + captions.yy + (_strh / 2) + 16, 20, 20, false);
            draw_set_colour(c_white);
            draw_set_alpha(1);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text(480, 492 + captions.yy, captions.str[i]);
            draw_set_alpha(1);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
        }
        
        break;
    }
    
    i--;
}
