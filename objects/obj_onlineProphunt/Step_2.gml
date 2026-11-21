if (instance_exists(obj_player))
{
    if (global.prophuntmode.select >= 0)
        obj_player.image_alpha = 0.25;
}

obj_hud.visible = false;
/**obj_shell.whitelist = ["toggle_collisions", "toggle_debug", "clear", "help"];
if global.server != -4*/
obj_shell.whitelist = ["toggle_collisions", "toggle_debug", "clear", "help", "overtime"];
with (obj_monolithblock_wake)
{
	with (instance_create(x, y, obj_monolithblock_sleep))
	{
		image_xscale = other.image_xscale
		image_yscale = other.image_yscale
	}
	instance_destroy(id, 0)
}

instance_destroy(obj_monolith, false);
instance_destroy(obj_potable_cage, false);
instance_destroy(obj_magicianPickup, false);
instance_destroy(obj_secret, false);
instance_destroy(obj_secretStart, false);
instance_destroy(obj_bacadmad, false);
instance_destroy(obj_baconsmacon, false);
instance_destroy(obj_baconsmacon_dead, false);
instance_destroy(obj_hipnatuese, false);
instance_destroy(obj_buddy, false);
instance_destroy(obj_magicianDoor, false);
instance_destroy(obj_key, false);
if room = beaker_intro
{
	instance_destroy(inst_101936)
}