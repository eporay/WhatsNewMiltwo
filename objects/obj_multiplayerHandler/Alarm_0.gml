if (isHost)
{
    socket = network_create_server(0, port, 48);
    plrId = 48;
}
else
{
    socket = network_create_socket(network_socket_tcp);
    network_connect_async(socket, ip, port);
}
