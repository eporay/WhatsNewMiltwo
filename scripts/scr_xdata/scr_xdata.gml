global.___tmpxdatafile = -4;
global.___tmpxdatainf = -4;
global.___tmpxdatachange = false;

function xdata_open(arg0)
{
    global.___tmpxdatafile = arg0;
    global.___tmpxdatainf = ds_map_create();
    global.___tmpxdatachange = false;
    xdata_load();
}

function xdata_close()
{
    if (global.___tmpxdatafile == -4)
        exit;
    
    if (global.___tmpxdatachange)
        xdata_save();
    
    global.___tmpxdatafile = -4;
    var sections = ds_map_keys_to_array(global.___tmpxdatainf);
    
    for (var i = 0; i < array_length(sections); i++)
    {
        var sec = sections[i];
        var sec_map = global.___tmpxdatainf[? sec];
        ds_map_destroy(sec_map);
    }
    
    ds_map_destroy(global.___tmpxdatainf);
    global.___tmpxdatainf = -4;
    global.___tmpxdatachange = false;
}

function xdata_write(arg0, arg1, arg2, arg3 = -4)
{
    if (global.___tmpxdatafile == -4)
        exit;
    
    if (!ds_map_exists(global.___tmpxdatainf, arg0))
        ds_map_add(global.___tmpxdatainf, arg0, ds_map_create());
    
    if (arg3 == -4 && is_int32(arg2))
        arg3 = UnknownEnum.Value_0;
    
    if (arg3 == -4 && is_bool(arg2))
        arg3 = UnknownEnum.Value_3;
    
    if (arg3 == -4 && is_real(arg2))
        arg3 = UnknownEnum.Value_1;
    
    if (arg3 == -4 && is_string(arg2))
        arg3 = UnknownEnum.Value_2;
    
    if (arg3 == -4)
    {
        arg3 = UnknownEnum.Value_1;
        arg2 = real(arg2);
    }
    
    global.___tmpxdatachange = true;
    global.___tmpxdatainf[? arg0][? arg1] = [arg3, arg2];
}

function xdata_save()
{
    if (global.___tmpxdatafile == -4)
        exit;
    
    var buf = buffer_create(1024, buffer_grow, 1);
    buffer_write(buf, buffer_u32, 1413563480);
    buffer_write(buf, buffer_u32, 1);
    var sections = ds_map_keys_to_array(global.___tmpxdatainf);
    
    for (var i = 0; i < array_length(sections); i++)
    {
        var sec = sections[i];
        var sec_map = global.___tmpxdatainf[? sec];
        var sec_len = string_length(sec);
        buffer_write(buf, buffer_u8, sec_len);
        
        for (var k = 1; k <= sec_len; k++)
            buffer_write(buf, buffer_u8, ord(string_char_at(sec, k)));
        
        buffer_write(buf, buffer_u16, ds_map_size(sec_map));
        var keys = ds_map_keys_to_array(sec_map);
        
        for (var j = 0; j < array_length(keys); j++)
        {
            var key = keys[j];
            var entry = sec_map[? key];
            var key_len = string_length(key);
            buffer_write(buf, buffer_u8, key_len);
            
            for (var k = 1; k <= key_len; k++)
                buffer_write(buf, buffer_u8, ord(string_char_at(key, k)));
            
            buffer_write(buf, buffer_u8, entry[0]);
            
            switch (entry[0])
            {
                case UnknownEnum.Value_0:
                    buffer_write(buf, buffer_s32, entry[1]);
                    break;
                
                case UnknownEnum.Value_1:
                    buffer_write(buf, buffer_f32, entry[1]);
                    break;
                
                case UnknownEnum.Value_2:
                    var slen = string_length(entry[1]);
                    buffer_write(buf, buffer_u16, slen);
                    
                    for (var k = 1; k <= slen; k++)
                        buffer_write(buf, buffer_u8, ord(string_char_at(entry[1], k)));
                    
                    break;
                
                case UnknownEnum.Value_3:
                    buffer_write(buf, buffer_bool, entry[1]);
                    break;
            }
        }
    }
    
    var comp_buf = buffer_compress(buf, 0, buffer_tell(buf));
    buffer_save(comp_buf, global.___tmpxdatafile);
    buffer_delete(comp_buf);
    buffer_delete(buf);
}

function xdata_load()
{
    if (!file_exists(global.___tmpxdatafile))
        return 0;
    
    try
    {
        var buf = buffer_load(global.___tmpxdatafile);
        buf = buffer_decompress(buf);
        global.___tmpxdatainf = ds_map_create();
        var magic = buffer_read(buf, buffer_u32);
        var version = buffer_read(buf, buffer_u32);
        
        if (magic != 1413563480)
        {
            buffer_delete(buf);
            return 0;
        }
        
        while (buffer_tell(buf) < buffer_get_size(buf))
        {
            var sec_len = buffer_read(buf, buffer_u8);
            
            if (sec_len <= 0)
                break;
            
            var sec_name = "";
            
            for (var i = 1; i <= sec_len; i++)
                sec_name += chr(buffer_read(buf, buffer_u8));
            
            var key_count = buffer_read(buf, buffer_u16);
            var sec_map = ds_map_create();
            
            for (var k = 0; k < key_count; k++)
            {
                var key_len = buffer_read(buf, buffer_u8);
                var key = "";
                
                for (var i = 1; i <= key_len; i++)
                    key += chr(buffer_read(buf, buffer_u8));
                
                var type = buffer_read(buf, buffer_u8);
                var val;
                
                switch (type)
                {
                    case UnknownEnum.Value_0:
                        val = buffer_read(buf, buffer_s32);
                        break;
                    
                    case UnknownEnum.Value_1:
                        val = buffer_read(buf, buffer_f32);
                        break;
                    
                    case UnknownEnum.Value_2:
                        var slen = buffer_read(buf, buffer_u16);
                        val = "";
                        
                        for (var i = 1; i <= slen; i++)
                            val += chr(buffer_read(buf, buffer_u8));
                        
                        break;
                    
                    case UnknownEnum.Value_3:
                        val = buffer_read(buf, buffer_bool);
                        break;
                    
                    default:
                        val = 0;
                        break;
                }
                
                sec_map[? key] = [type, val];
            }
            
            global.___tmpxdatainf[? sec_name] = sec_map;
        }
        
        buffer_delete(buf);
        return 1;
    }
    catch (e)
    {
        show_debug_message("xdata_load failed: " + string(e));
        return 0;
    }
}

function xdata_read(arg0, arg1, arg2)
{
    if (global.___tmpxdatafile == -4)
        return -4;
    
    if (ds_map_exists(global.___tmpxdatainf, arg0) && ds_map_exists(global.___tmpxdatainf[? arg0], arg1))
        return array_get(ds_map_find_value(global.___tmpxdatainf, arg0)[? arg1], 1);
    
    return arg2;
}

function xdata_section_exists(arg0)
{
    if (global.___tmpxdatafile == -4)
        return 0;
    
    return ds_map_exists(global.___tmpxdatainf, arg0);
}

function xdata_key_exists(arg0, arg1)
{
    if (global.___tmpxdatafile == -4 || !ds_map_exists(global.___tmpxdatainf, arg0))
        return 0;
    
    return ds_map_exists(global.___tmpxdatainf[? arg0], arg1);
}
