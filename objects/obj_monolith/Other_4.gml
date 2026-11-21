if global.escapeLap && obj_player.character= chars.bacon5
{
	instance_create(x + 16, y, obj_slipperybutter_deadly)
	instance_destroy(id, 0)
	exit;
}
if (ds_list_find_index(global.saveroom, id) != -1 || global.escapeActive)
    instance_destroy();
