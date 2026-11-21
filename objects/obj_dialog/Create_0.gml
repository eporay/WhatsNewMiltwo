dialogStuff = [];
currentDialog = 0;
active = false;

addDialog = function(arg0, arg1, arg2, arg3 = -4)
{
    array_push(dialogStuff, [arg0, arg2, arg3, arg1]);
};

textVisual = "";
textLetter = 1;
canProgress = false;
