if (mousemoved)
{
    if (global.pky_right || -global.pky_left || global.pky_up || global.pky_down || global.pky_jump || global.pky_grab)
        mousemoved = false;
}

hand_y = approach(hand_y, 540, 16);

if (tv_static < 0)
{
    if (global.pky_grab2)
        video_close();
    
    if (global.pky_jump2)
    {
        tv_file = get_open_filename("video file|*.mp4", "");
        
        if (tv_file != "")
        {
            tv_static = 0;
            tv_change = false;
            FMODevent_oneshot("event:/Sfx/UI/Oops!/transition");
        }
    }
    
    if (tv_index != -1)
    {
        var _move = global.pky_left2 + global.pky_right2;
        
        if (_move != 0)
        {
            tv_static = 0;
            tv_change = false;
            tv_indexnext += (global.pky_left2 + global.pky_right2);
            
            if (tv_indexnext < 1)
                tv_indexnext = tv_max;
            
            if (tv_indexnext > tv_max)
                tv_indexnext = 1;
            
            FMODevent_oneshot("event:/Sfx/UI/Oops!/transition");
        }
    }
}
else
{
    tv_static += 0.35;
    
    if (tv_static > 8)
    {
        var _stat = video_get_status();
        
        if (!tv_change)
        {
            video_close();
            
            if (_stat == 0)
            {
                tv_change = true;
                
                if (tv_file != "")
                {
                    video_open(tv_file);
                    
                    if (video_get_status() == 0)
                        tv_nsbuffer = 90;
                    
                    tv_file = "";
                    tv_index = -1;
                }
                else
                {
                    tv_index = tv_indexnext;
                    video_open(string("gameData/videos/tv{0}.mp4", tv_index));
                    
                    if (video_get_status() == 0)
                        tv_nsbuffer = 90;
                }
                
                video_set_volume(global.SfxVolume * global.SfxVolume * 2);
            }
            
            tv_static = 8;
        }
        else if (_stat == 1)
        {
            tv_static = 8;
        }
        else
        {
            tv_static = -1;
        }
    }
}

if (global.pky_start2)
{
    fadestage = 0;
    fadestate = "files";
}
