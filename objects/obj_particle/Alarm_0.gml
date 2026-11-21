if (!instance_exists(obj_multiplayerHandler))
    exit;

if (onlineSynced)
    exit;

var _size = 32;
var _data = [];
array_push(_data, 1, UnknownEnum.Value_4);
array_push(_data, 3, room);
array_push(_data, 3, sprite_index);
array_push(_data, 1, wrap(image_index, 0, 255));
array_push(_data, 3, clamp(x + 100, 0, 65535));
array_push(_data, 3, clamp(y + 100, 0, 65535));
array_push(_data, 3, hsp * 100);
array_push(_data, 3, vsp * 100);
array_push(_data, 3, grav * 100);
array_push(_data, 1, (image_angle / 360) * 255);
array_push(_data, 1, image_speed * 255);
array_push(_data, 2, image_xscale);
array_push(_data, 4, depth);

with (obj_multiplayerHandler)
{
    if (isHost)
        sendDataHost(_data, _size);
    else
        sendDataClient(_data, _size);
}
