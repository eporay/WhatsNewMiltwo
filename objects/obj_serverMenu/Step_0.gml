visible = global.connected;

if (!global.connected)
{
    on = false;
}
else if (!on)
{
    if (x == -100 && y == -100)
        instance_destroy();
    
    stophostingwarning = false;
    select = 4;
    
    if (place_meeting(x, y, obj_player) && global.pky_up2)
        on = true;
}
else
{
    if (instance_exists(obj_onlineLevelSelect))
        exit;
    
    if (stophostingwarning)
    {
        if (global.mky_jump2 || global.mky_slap2)
        {
            stophostingwarning = false;
            select = 4;
        }
        else if (global.mky_taunt2)
        {
            global.connected = false;
            
            if (global.server == -4)
                network_destroy(global.client);
            else
                network_destroy(global.server);
            
            instance_destroy(obj_onlineHandler);
            instance_destroy(obj_onlinePlayer);
            instance_destroy(obj_onlineTauntEffect);
            instance_destroy(obj_onlineRace);
            instance_destroy(obj_onlineProphunt);
            on = false;
        }
        
        exit;
    }
    var move = global.mky_down2 - global.mky_up2
	if move != 0
FMODevent_oneshot("event:/Sfx/General/Enemy/dart", obj_player.x, obj_player.y);

    select += (global.mky_down2 - global.mky_up2);
    select = clamp(select, (global.server == -4) ? 2 : -1, 4);
    
    if (global.mky_slap2)
    {
        on = false;
    }
    else if (global.mky_jump2)
    {
        switch (select)
        {
			            case -1:
scr_transfotip("[shake]NOT PORTED YET")
                on = false;
                break;
            case 0:
                with (obj_onlineHandler)
                    event_user(10);
                
                break;
            
            case 1:
                with (obj_onlineHandler)
                    event_user(11);
                
                break;
            
            case 2:
                stophostingwarning = true;
                break;
            
            case 4:
                on = false;
                break;
        }
    }
}
