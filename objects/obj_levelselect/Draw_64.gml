draw_set_font(global.creditsfont);
draw_set_halign(fa_center);
draw_text(480, 206, global.levels_worldNames[selectedWorld]);
draw_text(480, 334, string(selectedLevel + 1) + ": " + global.levels_arr[selectedWorld][selectedLevel][2]);
