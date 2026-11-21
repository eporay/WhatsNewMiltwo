if (!instance_exists(obj_player))
    exit;

obj_player.state = -999;
obj_player.x = -100;
obj_player.y = -100;
selectedlrp = lerp(selectedlrp, selected, 0.1);
if (bgsfadebuffer-- < 0)
{
    bgsfade = approach(bgsfade, 1, 0.016666666666666666);
    
    if (bgsfade >= 1)
    {
        bgsfadebuffer = floor(random_range(5, 10) * 60);
        var bgsselold = bgssel;
        
        while (bgssel == bgsselold)
            bgssel = irandom(array_length(bgs) - 1);
    }
}
else
{
    bgsfade = approach(bgsfade, 0.25, 0.016666666666666666);
}

bgx += 1;

if (menu == 0)
{
	
    if (global.mky_slap2)
    {
        with (obj_music)
            stop_music();
        
        generalReset();
        movespeed = 0;
        vsp = 0;
        hsp = 0;
        state = -4;
        door = "A";
        room_goto(Mainmenu);
        
        with (instance_create(0, 0, obj_option))
        {
            currentmenu = 11;
            selected = 3;
        }
    }
    
    var m = global.mky_down2 - global.mky_up2;
    
    if (m != 0)
    {
        selected += m;
		    FMODevent_oneshot("event:/Sfx/General/Enemy/dart", room_width / 2, room_width / 2);
        selected = clamp(selected, 0, array_length(menus[currentmenu]) - 1);
    }
    
    if (global.mky_jump2)
        menus[currentmenu][selected][2]();
}
else
{
    if (global.mky_slap2)
    {
        menu = 0;
        selected = 0;
    }
    
    if (keyboard_check_pressed(vk_anykey))
    {
        if (keyboard_check(vk_control) && keyboard_check(ord("V")))
        {
            keyboard_string = clipboard_get_text();
			FMODevent_oneshot("event:/Sfx/General/Enemy/dart", room_width / 2, room_width / 2);
            textInput = keyboard_string;
        }
        
        if (keyboard_check_pressed(vk_enter) || global.mky_jump2)
        {
            if (menu == 1)
            {
                connectIP = textInput;
                menu = 2;
                keyboard_string = "2222";
				
                textInput = keyboard_string;
            }
            else if (menu == 2)
            {
                connectPort = string_digits(textInput);
                
                if (string_length(connectPort) > 0)
                    connectPort = real(connectPort);
                else
                    connectPort = 2222;
                
                if (creating)
                {
                    network_destroy(global.client);
                    network_destroy(global.server);
                    global.client = -4;
                    global.server = network_create_server(1, connectPort, 256);
                    
                    if (global.server < 0)
                    {
                        var _port = connectPort;
                        
                        while (global.server < 0 && connectPort < 65535)
                        {
                            connectPort++;
                            global.server = network_create_server(1, connectPort, 256);
                        }
                        
                        if (connectPort != _port)
                            show_message($"Your port has been changed to: {connectPort}");
                    }
                    
                    global.connected = true;
					with (obj_music)
					                stop_music(false);
           
                    room_goto(Mainmenu);
                    obj_player.state = global.states.normal;
                    instance_destroy(obj_onlineHandler);
                    
                    with (instance_create(x, y, obj_onlineHandler))
                    {
                        ip = "localhost";
                        port = other.connectPort;
                    }
                }
                else
                {
					with (obj_music)
					                stop_music(false);

                    network_destroy(global.client);
                    network_destroy(global.server);
                    global.client = network_create_socket(network_socket_udp);
                    global.server = -4;
                    global.connected = true;
                    obj_player.state = global.states.normal;
                    room_goto(Mainmenu);
                    instance_destroy(obj_onlineHandler);
                    
                    with (instance_create(x, y, obj_onlineHandler))
                    {
                        ip = other.connectIP;
                        port = other.connectPort;
                    }
                }
            }
        }
        else
        {
			if keyboard_check_pressed(vk_anykey)
			FMODevent_oneshot("event:/Sfx/General/Enemy/dart", room_width / 2, room_width / 2);
            textInput = keyboard_string;
        }
    }
}
