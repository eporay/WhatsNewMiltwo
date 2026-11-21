if (room != hotel_soundtest)
{
    if (muisFmod)
    {
        fmod_studio_event_instance_stop(mu, UnknownEnum.Value_1);
        fmod_studio_event_instance_release(mu);
    }
    else
    {
        audio_stop_sound(mu);
    }
}
