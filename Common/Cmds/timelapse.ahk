; Runs a fake timelapse by showing the map assembled brush by brush.

SetTitleMatchMode, 1
IfWinNotExist, DromEd
    return
WinActivate, DromEd

Send :set_lighting_mode 1{Enter}
Send :set_lighting_depth 16{Enter}
Send :compress_br_ids{Enter}
Send :clear_surface_cache{Enter}
Send :find_obj TimelapseViewpoint{Enter}
Send :cam_to_brush{Enter}
Send :toggle_object_render 0{Enter}
Send :set_ignore_filters 0{Enter}

Sleep, 1000

Time := 1
While Time <= 250
{
    Send :time_filter_hi %Time%{Enter}
    Send :portalize{Enter}

    Sleep, 5000

    Send :screen_dump{Enter}

    Sleep, 100
    Time := Time + 1
}

Send :set_ignore_filters 1{Enter}
Send :time_filter_hi 0{Enter}
Send :toggle_object_render 1{Enter}
Send :portalize{Enter}
Send :play_schema dinner_bell{Enter}
