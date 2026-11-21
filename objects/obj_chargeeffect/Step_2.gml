depth = target.depth + 2;

if (target >= 0 && target.character == UnknownEnum.Value_5)
    sprite_index = spr_player1chargeEffect;

if (target >= 0 && target.character == UnknownEnum.Value_7)
    sprite_index = spr_player3chargeEffect;
if (target >= 0 && target.character ==10)
    sprite_index = spr_skatenicchargeeffect;
if target.state = global.states.jaronalaunch
{
	    x = target.x
    y = target.y ;
    image_angle = point_direction(0, 0, target.hsp, target.vsp)
    image_xscale = 1;
}
else if (target.state == global.states.mach3)
{
    x = target.x + (12 * image_xscale);
    y = target.y + 5;
    image_angle = 0;
    image_xscale = target.xscale;
}
else if (target.state == global.states.groundpound)
{
    x = target.x;
    y = target.y + 32;
    image_angle = -90;
    image_xscale = 1;
}
else
{
    instance_destroy();
}
