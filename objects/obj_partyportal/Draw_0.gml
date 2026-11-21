draw_self();

if (sprite_index == spr_partyportal)
{
    draw_set_alpha(1);
    draw_sprite(spr_partywarning, global.escapeLap, x, y + wave(-5, 5, 0.5, 5));
}
