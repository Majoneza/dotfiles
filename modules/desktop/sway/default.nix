{ pkgs, ... }:
{
    # Enable display manager for sway
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
                user = "greeter";
            };
        };
    };

    # Enable sway
    programs = {
        sway = {
            enable = true;
            xwayland.enable = true;
            package = null;
        };
    };

    # Enable music player deamon
    services.mpd.enable = true;

    # Install extension for display manger
    environment.systemPackages = with pkgs; [
        greetd.tuigreet
        autotiling
        swaybg
    ];
}
