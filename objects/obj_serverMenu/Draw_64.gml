if (!on)
    exit;

if (instance_exists(obj_onlineLevelSelect))
    exit;

draw_set_font(global.creditsfont);
draw_set_alpha(1);
draw_set_colour(c_black);
//draw_rectangle(100, 100, 860, 440, false);
draw_rectangle(100, 100 - 32, 860, 440, false);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if (stophostingwarning)
{
    draw_text(140, 190, "Are you sure?\n\nPress taunt to comfirm\nPress jump or grab to deny");
    exit;
}

draw_set_colour(merge_colour(c_black, c_white, (global.server == -4) ? 0.2 : ((select == -1) ? 1 : 0.5)));
draw_text(140, 190 - 40, "Start a Search N' Rescue round");
draw_set_colour(merge_colour(c_black, c_white, (global.server == -4) ? 0.2 : ((select == 0) ? 1 : 0.5)));
draw_text(140, 190, "Start a PropHunt round");
draw_set_colour(merge_colour(c_black, c_white, (global.server == -4) ? 0.2 : ((select == 1) ? 1 : 0.5)));
draw_text(140, 230, "Start a race");
draw_set_colour(merge_colour(c_black, c_white, (select == 2) ? 1 : 0.5));
draw_text(140, 270, (global.server == -4) ? "Leave Server" : "Stop Hosting");
draw_set_colour(merge_colour(c_black, c_white, (select == 3) ? 1 : 0.5));
draw_text(140, 310, "???");
draw_set_colour(merge_colour(c_black, c_white, (select == 4) ? 1 : 0.5));
draw_text(140, 350, "Exit");
draw_set_valign(fa_top);
draw_set_colour(c_white);
