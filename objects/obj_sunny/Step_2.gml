if (hitstun.is == false)
{
    event_inherited();
    
    switch (state)
    {
        case global.states.stun:
            scr_enemy_stun();
            break;
        
        case global.states.hit:
            scr_enemy_hit();
            break;
        
        case global.states.turn:
            scr_enemy_turn();
            break;
        
        case global.states.move:
            image_speed = 0.35;
            hsp = 0;
            break;
        
        case global.states.grab:
            scr_enemy_grabbed();
            break;
        
        case global.states.thrown:
            scr_enemy_thrown();
            break;
    }
}
else if (hitstun.time >= 0)
{
    image_speed = 0;
    x = hitstun.x + irandom_range(-5, 5);
    y = hitstun.y + irandom_range(-5, 5);
    hitstun.time--;
}
else
{
    x = hitstun.x;
    y = hitstun.y;
    hitstun.is = false;
}
