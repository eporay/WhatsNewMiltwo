surface_free(fadeSurface);

if (is_string(titlecardinfo[3]))
{
    fmod_studio_event_instance_stop(snd, UnknownEnum.Value_1);
    fmod_studio_event_instance_release(snd);
}
