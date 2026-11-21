if (instance_exists(obj_technicaldifficulty))
    exit;

if (mousemoved)
{
    if (global.pky_right || -global.pky_left || global.pky_up || global.pky_down || global.pky_jump || global.pky_grab)
        mousemoved = false;
}

hand_y = approach(hand_y, 540, 16);

if (tv_static < 0)
{
    if (file_txt == "")
        file_txt = string(lang_get_phrase("menunew_select"), file + 1, file_select, 2, lang_get_phrase($"menunew_select_hotel{file_select}"));
    
    file_selectnew += (global.pky_left2 + global.pky_right2);
    file_selectnew = wrap(file_selectnew, 0, 1);
    
    if (file_select != file_selectnew)
    {
        FMODevent_oneshot("event:/Sfx/UI/Oops!/transition");
        tv_static = 0;
    }
    else if (global.pky_jump2)
    {
        global.saveFile = global.wsbMOmInfo.dir + $"sandbox{file + 1}.xda";
        obj_player.targetRoom = hotel_start;
        
        if (file_select == 1)
            obj_player.targetRoom = hotel_halloween_start;
      
        
        with (obj_player)
        {
            global.resetRoom = targetRoom;
            xdata_open(global.saveFile);
            character = xdata_read("Modded", "c_char", UnknownEnum.Value_0);
            palIndex = xdata_read("Modded", "c_pal", 1);
            xdata_close();
            event_user(0);
            generalReset();
            door = "A";
            movespeed = 0;
            vsp = 0;
            hsp = 0;
            state = -4;
        }
        FMODstopAll()
        FMODevent_oneshot("event:/Sfx/General/Collects/bigcollect", 480, 270);
        FMODevent_oneshot("event:/Sfx/UI/Mainmenu/selectmovie");
        
        with (instance_create(0, 0, obj_technicaldifficulty))
        {
            func = function()
            {
                with (obj_player)
                    room_goto(targetRoom);
            };
        }
    }
}
else
{
    tv_static += 0.35;
    
    if (tv_static > 8)
    {
        file_txt = "";
        file_select = file_selectnew;
        tv_static = -1;
    }
}

if (global.pky_start2)
{
    fadestage = 0;
    fadestate = "files";
}