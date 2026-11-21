with (instance_create(x, y, obj_baddiedead))
{
    image_speed = 0;
    sprite_index = spr_butterAir
    hsp = 3 * sign(x - obj_player.x);
    vsp = -3;
}
