if (coltim > 0)
{
    coltim -= (1/30);
    col = merge_colour(colee, c_black, clamp(1 - coltim, 0, 1));
}

if (!(obj_player.state == global.states.walkfront && obj_player.sprite_index == obj_player.sprites.walkfront))
{
    circleSizeSpeed += 1.25;
    circleSize += circleSizeSpeed;
    
    if (circleSize >= 4000)
        instance_destroy();
}
else
{
    circleSizeSpeed = 0;
    circleSize = lerp(circleSize, 35, 0.125);
}
