repeat irandom(60) + 15
{
	x += hsp
	y += vsp
	image_alpha -= 0.0075
	if image_alpha <= 0 
		instance_destroy()
}