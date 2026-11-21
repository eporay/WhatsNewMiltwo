function scr_playerV_buzzsaw()
{
    image_speed = 0.7;
    hsp = movespeed * xscale;
    
    if (movespeed > 13)
        movespeed = 13;
    
    var move = global.pky_right + global.pky_left;
    buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
    
    if (buffers.afterimageBlur == 0)
    {
        buffers.afterimageBlur = 3;
        create_buzzsawAfterimage(sprite_index, image_index, x, y, xscale);
    }
    
    if (global.pky_down2)
    {
        if (vsp < 10)
            vsp = 10;
        
        sprite_index = spr_playerV_buzzsawFastFall;
    }
    
    if (vsp > 0)
        vsp += 0.1;
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !grounded && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_secretmetalblock) && !place_meeting(x + hsp, y, obj_destructibles))
    {
        if (vsp < 10)
            vsp = 10;
        
        movespeed = 9;
        xscale *= -1;
        image_index = 0;
        sprite_index = spr_playerV_buzzsawBump;
    }
    
    if (animation_end() && sprite_index == spr_playerV_buzzsawBump)
        sprite_index = spr_playerV_buzzsaw;
    
    if (grounded)
    {
        if (move != 0)
            xscale = move;
        
        if (movespeed < 12)
            movespeed = 12;
        
        flash = true;
        state = global.states.mach3;
        sprite_index = spr_playerV_rollgetup;
        image_index = 0;
        FMODevent_oneshot("event:/Sfx/Player/sawland", x, y);
    }
    
    doTaunt();
    
    if (slapBuffer > 8)
    {
        slapBuffer = false;
        
        if (move != 0)
            xscale = move;
        
        create_particleStatic(spr_crazyrunothereffect, x, y, xscale, 1);
        create_particleStatic(spr_grabcloud, x, y, xscale, 1);
        
        if (movespeed < 13)
            movespeed = 13;
        
        state = global.states.mach3;
        jumpstop = true;
        vsp = -8;
        sprite_index = spr_playerV_buzzsawCancel;
        image_index = 0;
    }
}
