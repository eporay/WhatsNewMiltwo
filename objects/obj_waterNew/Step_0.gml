with (instance_place(x, y, obj_player))
{
    var _states = [global.states.water, global.states.noclip];
    
    if (!array_contains(_states, state) && !is_transfo_all())
    {
        movespeed = hsp;
        state = global.states.water;
    }
}
