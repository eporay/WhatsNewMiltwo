image_speed = 0;
depth = 40;
gateinfo = [];
distance = 100;
surf = -4;
cancel = false;
notext = false;

function create_gate_layer(arg0, arg1, arg2, arg3, arg4, arg5, arg6 = false)
{
    array_push(gateinfo, [arg0, arg1, arg2, arg3, arg4, arg5, arg6]);
}

levelname = "";
titlecard = [spr_titlecardYard, spr_titlecardYardTitle1, spr_titlecardYardTitle2, "event:/Music/W1/Monolith Mangrove/titlecard"];
alarm[0] = 1;
bgalpha = 1;
visibleradius = 250;
textalpha = 0;
drawing = 0;
scoreViewer = -4;
