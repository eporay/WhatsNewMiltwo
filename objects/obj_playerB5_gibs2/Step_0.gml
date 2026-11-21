rot += (sqrt(abs(hsp + vsp)) * 2);

if (place_meeting(x + round(hsp), y, obj_solid))
    hsp *= -0.5;

if (place_meeting(x, y + round(vsp), obj_solid))
    vsp *= -0.5;

if (vsp < 32)
    vsp += 0.6;

if (!place_meeting(x + round(hsp), y, obj_solid))
    x += round(hsp);

if (!place_meeting(x, y + round(vsp), obj_solid))
    y += round(vsp);

if (round(hsp / 3) == 0 && round(vsp / 3) == 0)
    image_alpha -= 0.005;

if (image_alpha <= 0)
    instance_destroy();
