{ pkgs, username, ... }:
let
    wallpaperPath = "/home/${username}/wallpaper.png";
in
{
    home.packages = with pkgs; [
        rofi-wayland
        networkmanagerapplet
        pavucontrol

        libsForQt5.polkit-kde-agent
        libsForQt5.qtwayland
        libsForQt5.breeze-qt5
        libsForQt5.breeze-icons
        libsForQt5.qt5ct
        playerctl

        ark
        kate
        okular
        dolphin
    ];

    programs = {
        imv = {
            enable = true;
            settings = {
            };
        };
        waybar = {
            enable = true;
            systemd = {
                enable = true;
                target = "hyprland-session.target";
            };
            settings.mainBar = {
                layer = "top";
                position = "top";
                height = 10;
                modules-left = [
                    "privacy"
                    "mpris"
                    "wlr/taskbar"
                ];
                modules-center = [
                    "hyprland/workspaces"
                ];
                modules-right = [
                    "cpu"
                    "memory"
                    "tray"
                    "pulseaudio"
                    "temperature"
                    "battery"
                    "clock"
                ];
                "privacy" = {
                    transition-duration = 250;
                    modules = [
                        {
                            type = "screenshare";
                        }
                        {
                            type = "audio-in";
                        }
                        {
                            type = "audio-out";
                        }
                    ];
                };
                "mpris" = {
                    format = "{status_icon} {dynamic}";
                    format-playing = "{player_icon} {dynamic}";
                    player-icons = {
                        default = "🎵";
                    };
                    status-icons = {
                        paused = "⏸";
                        playing = "";
                        stopped = "■";
                    };
                };
                "wlr/taskbar" = {
                    format = "{icon}";
                    tooltip = true;
                    tooltip-format = "{title}";
                    sort-by-app-id = true;
                };
                "hyprland/workspaces" = {
                    move-to-monitor = true;
                };
                "cpu" = {
                    interval = 10;
                    format = "💻 {usage}%";
                };
                "memory" = {
                    interval = 30;
                    format = "💾 {percentage}%";
                    tooltip = true;
                    tooltip-format = "{used:0.1f}/{swapUsed:0.1f}GiB used";
                };
                "tray" = {
                    show-passive-items = false;
                };
                "pulseaudio" = {
                    format = "{icon} {volume}%";
                    format-muted = "🔇 {volume}%";
                    states = {
                        muted = 0;
                    };
                    format-icons = [
                        "🔈"
                        "🔉"
                        "🔊"
                    ];
                    on-click = "pavucontrol";
                    on-click-middle = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
                };
                "temperature" = {
                    critical-threshold = 95;
                    interval = 10;
                    format-critical = "⚠️ {temperatureC}°C";
                    format = "{temperatureC}°C";
                    tooltip = false;
                };
                "battery" = {
                    full-at = 95;
                    interval = 60;
                    states = {
                        warning = 35;
                        critical = 15;
                    };
                    format = "🔋 {capacity}%";
                };
                "clock" = {
                    interval = 60;
                    format = "{:%H:%M  %d.%m.%Y}";
                    calendar = {
                        mode = "month";
                        mode-mon-col = 3;
                        on-scroll = 1;
                    };
                    tooltip = false;
                };
            };
        };
        hyprlock = {
            enable = true;
            settings = {
                general = {
                    grace = 5;
                    no_fade_in = true;
                    no_fade_out = true;
                    ignore_empty_output = true;
                };
            };
        };
    };

    services = {
        hyprpaper = {
            enable = true;
            settings = {
                ipc = "on";
                preload = [
                    wallpaperPath
                ];
                wallpaper = [
                    ", ${wallpaperPath}"
                ];
            };
        };
        dunst = {
            enable = true;
            settings = {
            };
        };
    };

    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        xwayland.enable = true;
        settings = {
            # Programs
            "$terminal" = "alacritty";
            "$fileManager" = "dolphin";
            "$menu" = "rofi -show drun -show-icons";

            # Monitors
            monitor = ", preferred, auto, 1";

            # Autostart
            exec-once = [
                "nm-applet"
                "systemctl start --user dunst"
                "systemctl start --user plasma-polkit-agent"
            ];

            # General
            general = {
                layout = "dwindle";
                allow_tearing = true;
            };

            # Animations
            animations = {
                first_launch_animation = false;
            };

            # Input
            input = {
                kb_layout = "us";
                numlock_by_default = true;
                touchpad = {
                    disable_while_typing = true;
                    natural_scroll = true;
                };
            };

            # Environment
            env = [
                "XCURSOR_SIZE,24"
                "HYPRCURSOR_SIZE,24"
                "NIXOS_OZONE_WL,1"
                "QT_QPA_PLATFORMTHEME,qt5ct"
                "QT_QPA_PLATFORM,wayland"
            ];

            # Misc
            misc = {
                # Why is this enabled by default??
                disable_hyprland_logo = true;
                disable_splash_rendering = true;
                force_default_wallpaper = 0;

                # Save battery, use hyprctl reload
                disable_autoreload = true;
            };

            # XWayland
            xwayland = {
                enabled = true;

                # Force a scale of 1 on scaled displays
                force_zero_scaling = true;
            };

            # Dwindle
            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            cursor = {
                no_hardware_cursors = true;
                enable_hyprcursor = false;
            };

            # Keybinds
            bind = [
                "SUPER, T, exec, $terminal"
                "SUPER, Q, killactive"
                "SUPER, E, exec, $fileManager"
                "SUPER, R, exec, $menu"
                "SUPER, V, togglefloating,"
                "SUPER, G, togglegroup,"
                "SUPER, F, fullscreen, 1"
                "SUPER, L, exec, hyprlock"

                "SUPER, mouse_down, workspace, e+1"
                "SUPER, mouse_up, workspace, e-1"

                "SUPER, left, movefocus, l"
                "SUPER, right, movefocus, r"
                "SUPER, up, movefocus, u"
                "SUPER, down, movefocus, d"

                "SUPER, 1, workspace, 1"
                "SUPER, 2, workspace, 2"
                "SUPER, 3, workspace, 3"
                "SUPER, 4, workspace, 4"
                "SUPER, 5, workspace, 5"
                "SUPER, 6, workspace, 6"
                "SUPER, 7, workspace, 7"
                "SUPER, 8, workspace, 8"
                "SUPER, 9, workspace, 9"
                "SUPER, 0, workspace, 10"

                "SUPER SHIFT, F, fullscreen, 0"

                "SUPER SHIFT, left, movewindow, l"
                "SUPER SHIFT, right, movewindow, r"
                "SUPER SHIFT, up, movewindow, u"
                "SUPER SHIFT, down, movewindow, d"

                "SUPER SHIFT, 1, movetoworkspacesilent, 1"
                "SUPER SHIFT, 2, movetoworkspacesilent, 2"
                "SUPER SHIFT, 3, movetoworkspacesilent, 3"
                "SUPER SHIFT, 4, movetoworkspacesilent, 4"
                "SUPER SHIFT, 5, movetoworkspacesilent, 5"
                "SUPER SHIFT, 6, movetoworkspacesilent, 6"
                "SUPER SHIFT, 7, movetoworkspacesilent, 7"
                "SUPER SHIFT, 8, movetoworkspacesilent, 8"
                "SUPER SHIFT, 9, movetoworkspacesilent, 9"
                "SUPER SHIFT, 0, movetoworkspacesilent, 10"

                "SUPER CONTROL, left, swapactiveworkspaces, current -1"
                "SUPER CONTROL, right, swapactiveworkspaces, current +1"

                "SUPER CONTROL, 1, movecurrentworkspacetomonitor, 0"
                "SUPER CONTROL, 2, movecurrentworkspacetomonitor, 1"
                "SUPER CONTROL, 3, movecurrentworkspacetomonitor, 2"
                "SUPER CONTROL, 4, movecurrentworkspacetomonitor, 3"
                "SUPER CONTROL, 5, movecurrentworkspacetomonitor, 4"
                "SUPER CONTROL, 6, movecurrentworkspacetomonitor, 5"
                "SUPER CONTROL, 7, movecurrentworkspacetomonitor, 6"
                "SUPER CONTROL, 8, movecurrentworkspacetomonitor, 7"
                "SUPER CONTROL, 9, movecurrentworkspacetomonitor, 8"
            ];

            bindm = [
                "SUPER, mouse:272, movewindow"
                "SUPER, mouse:273, resizewindow"
            ];
        };
    };
}
