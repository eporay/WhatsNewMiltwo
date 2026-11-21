if global.escapeActive = 0
{
	with (instance_create(x, y, obj_jellyfish))
	{
		sprite_index = other.sprite_index
		image_speed = other.image_speed 
		image_alpha = 0.5
		depth = other.depth
	}
instance_destroy()
}