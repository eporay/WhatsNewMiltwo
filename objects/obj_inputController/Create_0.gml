count = gamepad_get_device_count();
global.inputMap = {};
global.inputFile = global.wsbMOmInfo.dir + "input.json";

if (!file_exists(global.inputFile))
    reset_input();
else
    global.inputMap = json_parse(loadString(global.inputFile));

global.gamepadConnected = false;
global.gamepadCurrent = -4;
global.gamepadDeadzones = {};
xdata_open(global.wsbMOmInfo.opt);
global.gamepadDeadzones.horizontal = xdata_read("Deadzones", "horiz", 0.1);
global.gamepadDeadzones.vertical = xdata_read("Deadzones", "verti", 0.2);
global.gamepadDeadzones.general = xdata_read("Deadzones", "general", 0.4);
global.gamepadDeadzones.press = xdata_read("Deadzones", "press", 0.4);
xdata_close();
global.buttonSpr = spr_gamepadbuttons_style1;
global.joystickSpr = spr_joystick_style1;
horizontalStickPressed = false;
verticalStickPressed = false;
horizontalStickPressedR = false;
verticalStickPressedR = false;
event_perform(75, 0);
alarm[0] = 1;
