{ ... }:
{
    programs.alacritty = {
        enable = true;
        settings = {
            env = {
                TERM = "xterm-256color";
            };
            window.dynamic_title = true;
            font = {
                normal.family = "RobotoMono Nerd Font Mono";
                size = 12;
            };
            selection.save_to_clipboard = true;
            keyboard.bindings = [
                { key = "N"; mods = "Control|Shift"; action = "CreateNewWindow"; }
                { key = "C"; mods = "Control|Shift"; action = "Copy"; }
                { key = "V"; mods = "Control|Shift"; action = "Paste"; }
                { key = "L"; mods = "Control|Shift"; action = "ClearHistory"; }
                { key = "X"; mods = "Control|Shift"; action = "ToggleViMode"; }
            ];
        };
    };
}
