if (obj_player.state == global.states.enterdoor && obj_player.x == (x + (sprite_width / 2)))
{
    if (scr_fadeout())
        FMODevent_oneshot("event:/Sfx/General/Level/Progression/door");
}
