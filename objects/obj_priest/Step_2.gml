if obj_player.character = 11
exit;
with (instance_place(x, y, obj_player))
{
    if (!is_transfo_all())
        break;
    
    flash = true;
    
    if (global.pky_run)
    {
        state = global.states.mach2;
        sprite_index = sprites.mach2;
    }
    else
    {
        state = global.states.normal;
        sprite_index = sprites.idle;
    }
    
    with (other)
    {
        sprite_index = spr_priest_pray;
        alarm[0] = 250;
    }
}
