roomthing = room == initObject || room == boss_bacon || room == hotel_soundtest || room == rank_room || room == Levelselect || room == Mainmenu || room == serverMenuShit || room == timesup_room || global.level == "tutorial" || string_starts_with(room_get_name(room), "hotel");
global.escapeMaxTimer = 10800;
global.Srank = 0;
tv.backindex = 16777215;

switch (global.level)
{
    case "yard":
        global.escapeMaxTimer = 12600;
        global.Srank = 22000;
        tv.backindex = 5395886;
        break;
    
    case "shell":
        global.Srank = 30000;
        tv.backindex = 8022949;
        break;
    
    case "beach":
        global.Srank = 0;
        tv.backindex = 8957923;
        break;
    
    case "rockbottom":
        global.escapeMaxTimer = 12600;
        global.Srank = 17000;
        tv.backindex = 11233280;
        break;
    
    case "crashout":
        global.Srank = 17000;
        tv.backindex = 8446200;
        break;
}

global.Arank = global.Srank / 1.2;
global.Brank = global.Arank / 2;
global.Crank = global.Brank / 3;
