function reset_input()
{
    global.inputMap = {};
    var InputsKey = {};
    InputsKey.left = [37];
    InputsKey.right = [39];
    InputsKey.up = [38];
    InputsKey.down = [40];
    InputsKey.jump = [90];
    InputsKey.slap = [88];
    InputsKey.taunt = [67];
    InputsKey.attack = [16];
    InputsKey.start = [27];
    InputsKey.superjump = [];
    InputsKey.groundpound = [];
    InputsKey.menu_left = [37];
    InputsKey.menu_right = [39];
    InputsKey.menu_up = [38];
    InputsKey.menu_down = [40];
    InputsKey.menu_confirm = [13, 90];
    InputsKey.menu_back = [8, 88];
    InputsKey.menu_clear = [67];
    var InputsPad = {};
    InputsPad.left = [32783, "joyLL"];
    InputsPad.right = [32784, "joyLR"];
    InputsPad.up = [32781, "joyLU"];
    InputsPad.down = [32782, "joyLD"];
    InputsPad.jump = [32769];
    InputsPad.slap = [32771];
    InputsPad.taunt = [32772];
    InputsPad.attack = [32774, 32776];
    InputsPad.start = [32778];
    InputsPad.superjump = [];
    InputsPad.groundpound = [];
    InputsPad.menu_left = [32783, "joyLL"];
    InputsPad.menu_right = [32784, "joyLR"];
    InputsPad.menu_up = [32781, "joyLU"];
    InputsPad.menu_down = [32782, "joyLD"];
    InputsPad.menu_confirm = [32769];
    InputsPad.menu_back = [32771];
    InputsPad.menu_clear = [32772];
    var inputs = ["left", "right", "down", "up", "jump", "slap", "taunt", "attack", "start", "superjump", "groundpound", "menu_up", "menu_down", "menu_left", "menu_right", "menu_confirm", "menu_back", "menu_clear"];
    
    for (q = 0; q < array_length(inputs); q++)
    {
        var inp = inputs[q];
        var _inpKey = variable_instance_get(InputsKey, inp);
        var _inpPad = variable_instance_get(InputsPad, inp);
        variable_struct_set(global.inputMap, $"k-{inp}", _inpKey);
        variable_struct_set(global.inputMap, $"p-{inp}", _inpPad);
    }
    
    var q = json_stringify(global.inputMap, false);
    var _file = file_text_open_write(global.inputFile);
    file_text_write_string(_file, q);
    file_text_close(_file);
}

function read_input(arg0, arg1 = false)
{
    try
    {
        if (obj_shell.isOpen)
            return false;
        
        var _returnButton = false;
        var _returnJoy = false;
        var _axLH = -4;
        var _axLV = -4;
        var _axRH = -4;
        var _axRV = -4;
        var _pDeadzone = 0;
        var _horizDeadzone = 0;
        var _vertDeadzone = 0;
        var _prejoy = false;
        var keyboardKey = variable_struct_get(global.inputMap, "k-" + arg0);
        var gamepadButton = variable_struct_get(global.inputMap, "p-" + arg0);
        
        if (array_length(keyboardKey) != 0)
        {
            for (var i = 0; i < array_length(keyboardKey); i++)
            {
                if ((arg1 ? keyboard_check_pressed : keyboard_check)(keyboardKey[i]))
                    _returnButton = true;
            }
        }
        
        if (array_length(gamepadButton) != 0)
        {
            for (var i = 0; i < array_length(gamepadButton); i++)
            {
                var _joystick = is_string(gamepadButton[i]);
                
                if (_joystick)
                {
                    if (!_prejoy)
                    {
                        _prejoy = true;
                        _axLH = gamepad_axis_value(global.gamepadCurrent, gp_axislh);
                        _axLV = gamepad_axis_value(global.gamepadCurrent, gp_axislv);
                        _axRH = gamepad_axis_value(global.gamepadCurrent, gp_axisrh);
                        _axRV = gamepad_axis_value(global.gamepadCurrent, gp_axisrv);
                        _pDeadzone = clamp(global.gamepadDeadzones.general + global.gamepadDeadzones.press, 0, 0.99);
                        _horizDeadzone = clamp(global.gamepadDeadzones.general + global.gamepadDeadzones.horizontal, 0, 0.99);
                        _vertDeadzone = clamp(global.gamepadDeadzones.general + global.gamepadDeadzones.vertical, 0, 0.99);
                    }
                    
                    switch (gamepadButton[i])
                    {
                        case "joyLL":
                            if (_axLH < -_horizDeadzone)
                                _returnJoy = true;
                            
                            break;
                        
                        case "joyLR":
                            if (_axLH > _horizDeadzone)
                                _returnJoy = true;
                            
                            break;
                        
                        case "joyLU":
                            if (_axLV < -_vertDeadzone)
                                _returnJoy = true;
                            
                            break;
                        
                        case "joyLD":
                            if (_axLV > _vertDeadzone)
                                _returnJoy = true;
                            
                            break;
                        
                        case "joyRL":
                            if (_axRH < -_horizDeadzone)
                                _returnJoy = true;
                            
                            break;
                        
                        case "joyRR":
                            if (_axRH > _horizDeadzone)
                                _returnJoy = true;
                            
                            break;
                        
                        case "joyRU":
                            if (_axRV < -_vertDeadzone)
                                _returnJoy = true;
                            
                            break;
                        
                        case "joyRD":
                            if (_axRV > _vertDeadzone)
                                _returnJoy = true;
                            
                            break;
                    }
                }
                else if ((arg1 ? gamepad_button_check_pressed : gamepad_button_check)(global.gamepadCurrent, gamepadButton[i]))
                {
                    _returnButton = true;
                }
            }
        }
        
        if (arg1)
        {
            if (_returnButton)
                return _returnButton;
            
            var _old_str = "gpt_" + arg0;
            var _val = variable_global_get(_old_str);
            variable_global_set(_old_str, _returnJoy);
            return _val == 0 && _returnJoy;
        }
        else
        {
            return _returnButton || _returnJoy;
        }
    }
    catch (e)
    {
        return false;
    }
}
