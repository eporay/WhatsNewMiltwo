if (fadein)
{
    image_alpha += accel;
    
    if (image_alpha >= 1)
    {
		if room_exists(targetRoom)
		{
		
        room_goto(targetRoom);
        fadein = false;
		}
		else
		{
			audio_stop_all()
			FMODstopAll()
			        room_goto(hotel_2763);
					scr_soundeffect(sfx_pop)
         instance_destroy();
		}
    }
}
else
{
    image_alpha -= accel;
    
    if (image_alpha <= 0)
        instance_destroy();
}
