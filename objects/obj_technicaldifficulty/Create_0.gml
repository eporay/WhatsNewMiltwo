depth = obj_hud.depth - 25;
FMODevent_oneshot("event:/Sfx/UI/Oops!/transition");

with (obj_player)
    plrsnds_play(sfx.slam, x, y);
func = -4;
staticIndex = 0;
showStatic = true;
showTechnical = false;
technicalSprite = get_baconera(spr_pleasestandby, obj_player.character);
technicalIndex = irandom_range(0, sprite_get_number(technicalSprite) - 1);
backgroundSprite = spr_pleasestandbyBackground