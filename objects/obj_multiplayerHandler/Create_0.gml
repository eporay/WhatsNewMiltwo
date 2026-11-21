show_message("UNFINISHED AND SCRAPPED DONT USE!!!!!!");
ip = "127.0.0.1";
isHost = false;
socket = -4;
port = 2236;
plrId = -4;
plrObj = instance_find(obj_player, 0);
plrList = array_create(49, 240);
plrDraw = array_create(49, -4);
plrDrawExtra = array_create(49, -4);
plrDrawMe = 0;
plrUpdateDelay = 0;
tempInfo = -4;
alarm[0] = 1;

function sendDataClient(arg0 = [], arg1 = 8)
{
    var _buf = buffer_create(arg1, buffer_fixed, 1);
    
    for (var i = 0; i < array_length(arg0); i += 2)
        buffer_write(_buf, arg0[i], arg0[i + 1]);
    
    network_send_packet(socket, _buf, buffer_get_size(_buf));
    buffer_delete(_buf);
}

function sendDataHost(arg0 = [], arg1 = 8, arg2 = -4)
{
    var _buf = buffer_create(arg1, buffer_fixed, 1);
    
    for (var i = 0; i < array_length(arg0); i += 2)
        buffer_write(_buf, arg0[i], arg0[i + 1]);
    
    if (arg2 >= 0)
    {
        network_send_packet(arg2, _buf, buffer_get_size(_buf));
    }
    else
    {
        for (var i = 0; i < array_length(plrList); i++)
            network_send_packet(i, _buf, buffer_get_size(_buf));
    }
    
    buffer_delete(_buf);
}
