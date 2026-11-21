function scr_player_noclip()
{
    var spd = global.pky_run ? 32 : 16;
    y += ((global.pky_down - global.pky_up) * spd);
    x += ((global.pky_right + global.pky_left) * spd);
    hsp = 0;
    vsp = 0;
    
    if (global.pky_jump2)
        state = global.states.normal;
}
