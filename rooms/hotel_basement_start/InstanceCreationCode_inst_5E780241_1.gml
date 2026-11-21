enterfunc = function()
{
	slow = 1
	if !instance_exists(obj_fadeout)
    scr_fadeout(slow ? 0.005 : 0.0175);
	gravity = -0.1

	shake += 0.15 * 2
	depth = 300 - 1
};
