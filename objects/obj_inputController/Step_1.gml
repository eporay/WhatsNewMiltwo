var _Deadzone = global.gamepadDeadzones.general + global.gamepadDeadzones.press;
_Deadzone = clamp(_Deadzone, 0, 0.99);

if (global.gamepadConnected && !gamepad_is_connected(global.gamepadCurrent))
{
    global.gamepadConnected = false;
    global.gamepadCurrent = -4;
}

if (global.gamepadConnected)
{
    if (abs(gamepad_axis_value(global.gamepadCurrent, gp_axislh)) < _Deadzone)
        horizontalStickPressed = false;
    
    if (abs(gamepad_axis_value(global.gamepadCurrent, gp_axislv)) < _Deadzone)
        verticalStickPressed = false;
    
    if (abs(gamepad_axis_value(global.gamepadCurrent, gp_axisrh)) < _Deadzone)
        horizontalStickPressedR = false;
    
    if (abs(gamepad_axis_value(global.gamepadCurrent, gp_axisrv)) < _Deadzone)
        verticalStickPressedR = false;
}

global.mky_left = -read_input("menu_left");
global.mky_left2 = -read_input("menu_left", true);
global.mky_right = read_input("menu_right");
global.mky_right2 = read_input("menu_right", true);
global.mky_up = read_input("menu_up");
global.mky_up2 = read_input("menu_up", true);
global.mky_down = read_input("menu_down");
global.mky_down2 = read_input("menu_down", true);
global.mky_jump = read_input("menu_confirm");
global.mky_jump2 = read_input("menu_confirm", true);
global.mky_slap = read_input("menu_back");
global.mky_slap2 = read_input("menu_back", true);
global.mky_taunt = read_input("menu_clear");
global.mky_taunt2 = read_input("menu_clear", true);
global.pky_left = -read_input(global.modifiers.flipped ? "right" : "left");
global.pky_left2 = -read_input(global.modifiers.flipped ? "right" : "left", true);
global.pky_right = read_input(global.modifiers.flipped ? "left" : "right");
global.pky_right2 = read_input(global.modifiers.flipped ? "left" : "right", true);
global.pky_up = read_input("up");
global.pky_up2 = read_input("up", true);
global.pky_down = read_input("down");
global.pky_down2 = read_input("down", true);
global.pky_jump = read_input("jump");
global.pky_jump2 = read_input("jump", true);
global.pky_grab = read_input("slap");
global.pky_grab2 = read_input("slap", true);
global.pky_taunt = read_input("taunt");
global.pky_taunt2 = read_input("taunt", true);
global.pky_run = read_input("attack");
global.pky_run2 = read_input("attack", true);
global.pky_start = read_input("start");
global.pky_start2 = read_input("start", true);
global.pky_superjump = read_input("superjump");
global.pky_superjump2 = read_input("superjump", true);
global.pky_groundpound = read_input("groundpound");
global.pky_groundpound2 = read_input("groundpound", true);
