if (other.state == global.states.grab || other.state == global.states.hammerattack)
{
    with (other)
    {

        state = global.states.coconut_intro;
        sprite_index = spr_player_coconut_intro;
        image_index = 0;
		var remastered =1
		if remastered
		scr_transfotip("[wave][G] Launch [U][D] Angle Launch [J] Jump");
		else
        scr_transfotip("[wave][G] Shoot [U][D] Angle Shot [J] Jump");
    }
    
    instance_destroy();
}
