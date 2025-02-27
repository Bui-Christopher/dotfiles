{ ... }:

{
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                disable_loading_bar = false;
                grace = 300;
                hide_cursor = true;
            };
            background = [{
                blur_passes = 3;
                blur_size = 8;
            }];
            input-field = [{
                size = "200, 60";
                outline_thickness = 2;
                rounding = -1;
                shadow_passes = 2;
                outer_color = "rgb(665c54)";
                inner_color = "rgb(3c3836)";
                check_color = "rgb(d79921)";
                fail_color = "rgb(cc241d)";
                fade_on_empty = false;
                # placeholder_text = "<i><span foreground=\"##cad3f5\">Input Password...</span></i>";
                fail_text = "";
            }];
        };
    };
}
