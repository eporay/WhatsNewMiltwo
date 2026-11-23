

if (instance_exists(obj_player))
{
    if (global.prophuntmode.select >= 0)
    {
      
        sprite_index = (obj_player.movespeed > 1) ? global.prophuntmode.sprites[global.prophuntmode.select][1] : global.prophuntmode.sprites[global.prophuntmode.select][0];
        image_speed = 0.35;
    }
}
