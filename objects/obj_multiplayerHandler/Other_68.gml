var _asType = async_load[? "type"];

if (isHost && (_asType == 1 || _asType == 2))
{
    var _asSocket = async_load[? "socket"];
    
    switch (_asType)
    {
        case 1:
            plrList[_asSocket] = 240;
            sendDataHost([1, UnknownEnum.Value_0, 1, _asSocket], 8, _asSocket);
            break;
        
        case 2:
            for (var i = 0; i < array_length(plrList); i++)
            {
                if (plrList[i] == _asSocket)
                {
                    array_delete(plrList, i, 1);
                    break;
                }
            }
            
            break;
    }
}
else if (_asType == 3)
{
    if (isHost)
    {
        tempInfo = [async_load[? "socket"], async_load[? "buffer"]];
        event_user(0);
    }
    else
    {
        tempInfo = async_load[? "buffer"];
        event_user(1);
    }
}
