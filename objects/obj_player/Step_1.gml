isMildred = character == UnknownEnum.Value_0 || character = 12 || character == UnknownEnum.Value_1 || character == UnknownEnum.Value_8 || character = chars.juan

if (global.pky_jump2)
    jumpBuffer = 15;

if (global.pky_grab2)
    slapBuffer = 15;
if character = 11
{
	        if (!instance_exists(obj_skateboardViewer))
            instance_create(0, 0, obj_skateboardViewer);
			sprayCans = 4
}
jumpBuffer = approach(jumpBuffer, 0, 1);
slapBuffer = approach(slapBuffer, 0, 1);
playerSounds();

if (supertaunt >= 10 && !canSupertaunt)
{
    canSupertaunt = true;
    flash = true;
    FMODevent_oneshot("event:/Sfx/Player/gotsupertaunt", x, y);
}
else if (supertaunt < 10 && canSupertaunt)
{
    canSupertaunt = false;
}

if (characterOld != character)
    event_user(0);
