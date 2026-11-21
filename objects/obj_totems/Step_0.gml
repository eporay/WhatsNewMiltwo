FMODSet3dPos(snd, x, y);
y = wave(ystart - 5, ystart + 5, 5, 5);

if (place_meeting(x, y, obj_player))
{
    xdata_open(global.saveFile);
    xdata_write("General", string("Totem{0}", totem), true);
    obj_savesystem.saveiconTimer = 60;
    obj_totemViewer.goawayTimer = 180;
    obj_totemViewer.totemIndex = totem;
    with (obj_player)
	{
		if character = 10
		{
			repeat (5)
			    instance_create(x + irandom_range(-70, 70), y + irandom_range(-70, 70), obj_notes).sprite_index = spr_heart_part;
		}
	}
    with (obj_totemViewer)
        event_user(0);
    
    xdata_close();
    instance_destroy();
    create_particleStatic(spr_genericpoofeffect, x, y, 1);
}

image_index = totem;
