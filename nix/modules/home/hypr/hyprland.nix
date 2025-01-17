{ inputs, pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        plugins = [
            # pkgs.hyprlandPlugins.hyprtrails
        ];
        systemd.variables = ["--all"];
        settings = {
            input = {
                touchpad.natural_scroll = true;
                repeat_rate = 30;
                kb_layout = "us";
                # force_no_accel = false;
                # accel_profile = "flat"; # adaptive | flat
                # sensitivity = -0.55; # -1.0 to 1.0, 0 means no modification.
            };

            env = [
                "XDG_SESSION_TYPE,wayland"
                "GBM_BACKEND,nvidia-drm"
                "__GLX_VENDOR_LIBRARY_NAME,nvidia"
                "LIBVA_DRIVER_NAME,nvidia"
                "WLR_DRM_NO_ATOMIC,1"
            ];

            general = {
                gaps_in = 10;
                gaps_out = 20;
                border_size = 5;
                "col.active_border" = "rgba(33ccffee) rgba(00ff00ee) 45deg";
                "col.inactive_border" = "rgba(595959aa)";
            };

            # "$mod, S, togglespecialworkspace, scratchpad"
            # "$mod SHIFT, S, movetoworkspace, special:scratchpad"

            cursor = {
                enable_hyprcursor = false;
            };

            decoration = {
                rounding = 4;
                blur = {
                    enabled = true;
                    size = 3;
                };
                dim_strength = 0.3;
                # windowrule = opacity 0.90 override 0.90 override 0.95 override,^(org.wezfurlong.wezterm)$

                shadow = {
                    enabled = true;
                    color = "rgba(1a1a1aee)";
                };
            };

            animations = {
                enabled = "yes";
                bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
                animation = [
                    "windows, 1, 7, myBezier"
                    "windowsOut, 1, 100, default, popin 10%"
                    "border, 1, 10, default"
                    "borderangle, 1, 8, default"
                    "fade, 1, 7, default"
                    "workspaces, 1, 5, default, slidefadevert"
                ];
            };

            misc = {
                disable_hyprland_logo = true;
                disable_splash_rendering = true;
                # force_default_wallpaper = -1;
                # enable_swallow = true;
            };

            dwindle = {
              # pseudotile = "yes";
              preserve_split = "yes";
            };

            "$mainMod" = "SUPER";
            "$terminal" = "wezterm";
            # "$launcher" = "pkill rofi || rofi -show drun -modi drun,filebrowser,run,window";
            "$launcher" = "pkill rofi || rofi -show drun -modi drun";

            bind = [
                # Starting Applications
                "$mainMod, RETURN, exec, $terminal"
                "$mainMod, d, exec, $launcher"
                "$mainMod, L, exec, systemctl suspend"

                # Screenshot
                ", Print, exec, hyprshot -m window"

                # Gaming/Passthrough Mode
                # ", f12, submap, clean"
                # ", f12, submap, reset"

                # Media Keys
                ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
                ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"
                ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

                # Brightness
                ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
                ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"

                # Keyboard Brightness
                ", keyboard_brightness_up_shortcut, exec, brightnessctl -d *::kbd_backlight set +33%"
                ", keyboard_brightness_down_shortcut, exec, brightnessctl -d *::kbd_backlight set 33%-"


                # Window Management
                "$mainMod, left, movefocus, l"
                "$mainMod, right, movefocus, r"
                "$mainMod, up, movefocus, u"
                "$mainMod, down, movefocus, d"

                "$mainMod, Q, killactive,"
                "$mainMod, V, togglefloating,"
                "$mainMod, R, togglesplit,"
                "$mainMod, F, fullscreen,"
            ] ++ (
                    # Workspaces: binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
                    builtins.concatLists (builtins.genList (i:
                        let ws = i + 1;
                        in [
                            "$mainMod, code:1${toString i}, workspace, ${toString ws}"
                            "$mainMod SHIFT, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
                        ]
                    )
                9)
            );

            # Move/resize windows with mainMod + LMB/RMB and dragging
            bindm = [
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ];

            plugin = {
                # hyprtrails = {
                #     color = "rgba(ffaa00ff)";
                # }
            };

            exec-once = [
                "waybar"
                "${pkgs.hyprpaper}/bin/hyprpaper"
            ];
        };
    };

    # Theming
    home.pointerCursor = {
        gtk.enable = true;
        # x11.enable = true;
        package = pkgs.capitaine-cursors-themed;
        name = "Capitaine Cursors (Gruvbox) - White";
        size = 16;
    };

    gtk = {
        enable = true;
    };
}
