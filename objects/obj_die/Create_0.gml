pixels = []

multdelay = 74
spd = 0

alarm[0] = 1

depth = -100
uniformLight = shader_get_uniform(shd_fullshade, "lightest");
uniformDark = shader_get_uniform(shd_fullshade, "darkest");