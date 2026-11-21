x = 0;
y = 0;
depth = 15;
instance_destroy(obj_onlineRace);
ds_list_clear(global.saveroom);
ds_list_clear(global.escaperoom);
ds_list_clear(global.followers);
canContinue = false;
fadeAlpha = 0;
cutscenePart = 0;
obj_player.state = -4;
global.combo.timer = 0;
showRank = false;
showRankText = false;
rankIndex = 0;
race = global.racemode.active
tutorial =  global.level = "tutorial"
whitefade = 0;
blackfade = 0;
showWhite = false;
showBlack = false;
newrecord = 0
xdata_open(global.saveFile);
if !race
{
		var hasbeaten = xdata_read(global.level, "TimeSet", 0);
		var personalbest = xdata_read(global.level, "PersonalBest", 0);
		if !hasbeaten || global.level_timer < personalbest 
		{
		xdata_write(global.level, "PersonalBest", global.level_timer);
		xdata_write(global.level, "TimeSet", 1);

		newrecord = 1
		scr_soundeffect(sfx_newrecord, 1, false);
		
		}
}
		xdata_close()
with (obj_music)
{
    stop_music();
    
    if (FMODevent_isplaying(escapeInst))
        fmod_studio_event_instance_stop(escapeInst, UnknownEnum.Value_1);
}

global.escapeActive = false;

FMODstopAll();
var _rankIndex = 0;

if (global.collect >= global.Crank)
    _rankIndex = 1;

if (global.collect >= global.Brank)
    _rankIndex = 2;

if (global.collect >= global.Arank)
    _rankIndex = 3;

if (global.collect >= global.Srank)
    _rankIndex = 4;

if (scr_Prank())
    _rankIndex = 5;

music = FMODcreate_event("event:/Music/General/ranks");

if (!tutorial)
{
	if race
	fmod_studio_event_instance_set_parameter_by_name(music, "state", 0);
	else
    fmod_studio_event_instance_set_parameter_by_name(music, "state", _rankIndex);
    fmod_studio_event_instance_start(music);
}

rankspr = spr_rankD;
ranktextSpr = spr_rankD_text;
var _col = 7884848;
var _col2 = 4729105;
gotoBackground = 0;

switch (_rankIndex)
{
    case 0:
        gotoBackground = 1;
        rankspr = spr_rankD;
        ranktextSpr = spr_rankD_text;
        _col = 7884848;
        _col2 = 4729105;
        break;
    
    case 1:
        gotoBackground = 2;
        rankspr = spr_rankC;
        ranktextSpr = spr_rankC_text;
        _col = 4771936;
        _col2 = 28672;
        break;
    
    case 2:
        gotoBackground = 3;
        rankspr = spr_rankB;
        ranktextSpr = spr_rankB_text;
        _col = 16295984;
        _col2 = 11030568;
        break;
    
    case 3:
        gotoBackground = 4;
        rankspr = spr_rankA;
        ranktextSpr = spr_rankA_text;
        _col = 248;
        _col2 = 80;
        break;
    
    case 4:
        gotoBackground = 5;
        rankspr = spr_rankS;
        ranktextSpr = spr_rankS_text;
        _col = 37088;
        _col2 = 10392;
        break;
    
    case 5:
        rankspr = spr_rankP;
        ranktextSpr = -4;
        _col = 10423551;
        _col2 = 5179331;
        break;
}
if race
{
	        gotoBackground = 0;
        rankspr = spr_rankD;
        ranktextSpr = spr_rankRACETEXT;
        _col = 7884848;
        _col2 = 4729105;
}
uniform1 = shader_get_uniform(shd_fullshade, "lightest");
uniform2 = shader_get_uniform(shd_fullshade, "darkest");
rankSurf = -4;
col = [color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255];
col2 = [color_get_red(_col2) / 255, color_get_green(_col2) / 255, color_get_blue(_col2) / 255];
colorAlpha = 0;
ranktimer = tutorial ? 60 : 180;
shake = 0;
textPos = 0;
text = [];
if race
{
array_push(text, [false, $"PLACE: DUMMY"]);
array_push(text, [false, $"TIME: {timeString(global.level_timer)}"]);
array_push(text, [false, $"FASTEST SPEED: {obj_player.fastestspeed}"]);

}
else
{
array_push(text, [false, $"SCORE: {global.collect}"]);
array_push(text, [false, $"TIME: {timeString(global.level_timer)}"]);
array_push(text, [false, "DAMAGE: DUMMY"]);
array_push(text, [false, $"HIGHEST COMBO: {global.combo.highest}"]);
xdata_open(global.saveFile)
var _personalbest = xdata_read(global.level, "PersonalBest", 0);
array_push(text, [false, $"PERSONAL BEST TIME: {timeString(_personalbest)}"]);
xdata_close()

if newrecord
array_push(text, [false, $"[wave2]NEW RECORD!"]);
}
global.escapeTimer = 7200;
toppinPos = 0;
toppins = [];
array_push(toppins, [false, global.toppins[0], 540, 0]);
array_push(toppins, [false, global.toppins[1], 540, 1]);
array_push(toppins, [false, global.toppins[2], 540, 2]);
array_push(toppins, [false, global.toppins[3], 540, 3]);
array_push(toppins, [false, global.toppins[4], 540, 4]);
backgroundX = 0;
backgroundY = 0;
backgroundAlpha = 0;
backgroundIndex = 0;
showBackground = false;

if (!tutorial)
    alarm[3] = 35;

destroy = false;
