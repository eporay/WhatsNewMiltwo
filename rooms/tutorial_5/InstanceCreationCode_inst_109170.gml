totem = 0;
xdata_open(global.saveFile);
var isCollected = xdata_read("General", $"Totem{totem}", false);
xdata_close();

if (isCollected)
    instance_destroy();
