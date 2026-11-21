y = wave(ystart - 5, ystart + 5, 2, 2);

if (place_meeting(x, y, obj_player))
{
    scr_transfotip("[wave2]You got the key!");
    global.key = true;
    ds_list_add(global.saveroom, id);
    instance_destroy();
	create_collect(sprite_index, x, y);
}
image_speed =0.35