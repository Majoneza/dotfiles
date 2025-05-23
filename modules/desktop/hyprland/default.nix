{ pkgs, ... }:
{
    # Enable display manager for hyprland
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
                user = "greeter";
            };
        };
    };

    # Install hyprland
    programs = {
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
    };

    # Enable music player deamon
    services.mpd.enable = true;

    # Install extension for display manger
    environment.systemPackages = with pkgs; [
        greetd.tuigreet
    ];
}
