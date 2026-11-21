xdata_open(global.saveFile);
image_index = totem;

if (xdata_read("General", string("Totem{0}", totem), false) == true)
    instance_destroy();

xdata_close();
