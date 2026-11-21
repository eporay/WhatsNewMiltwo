bgs = [[bg_yardAForestTop3, bg_yardAForestTop2, bg_yardAForestTop1], [bg_shellA3, bg_shellA2, bg_shellA1], [bg_beach1, bg_beach2, bg_beach3, bg_beach4, bg_beach5], [bg_beach1, bg_beach2, bg_beach3, bg_beach4, bg_beach5], [bg_beaker4_1, bg_beaker3_1, bg_beaker2_1, bg_beaker1_1, fg_beaker1_1]];
bgssel = irandom(array_length(bgs) - 1);
bgsfade = 0.1;
bgsfadebuffer = floor(random_range(5, 10) * 60);
menus = [];
currentmenu = 1;
selected = 1;
selectedlrp = selected;
move = 0;
menu = 0;
array_push(menus, []);
array_push(menus, []);
var _create = [-4, "Create Server", function()
{
    menu = 2;
    creating = true;
    keyboard_string = "";
    textInput = "2222";
}];
var _join = [-4, "Join Server", function()
{
    menu = 1;
    creating = false;
    keyboard_string = "";
    textInput = "";
}];
var _user = [-4, "Username", function()
{

global.username = get_string("Type the user here", global.username)
}];
desc = ["manage the server and start game modes", "join a round and have some fun", "self explanitory."]
array_push(menus[1], _create);
array_push(menus[1], _join);
array_push(menus[1], _user);
bgx = 0;
textInput = "";
creating = false;
connectIP = "";
connectPort = "";
with (obj_music)
                stop_music(false);
                scr_music(mu_prophunt_waiting, true);