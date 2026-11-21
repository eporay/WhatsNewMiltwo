draw_sprite_ext(sprite_index, image_index, x + xoffset, y + yoffset, xscaleMulti * xscale, yscaleMulti, image_angle, image_blend, image_alpha);


xscaleMulti = lerp(xscaleMulti, 1, 0.35);
yscaleMulti = lerp(yscaleMulti, 1, 0.35);
