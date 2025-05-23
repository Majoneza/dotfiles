{ pkgs, ... }:
{
    # Enable flatpak
    services.flatpak.enable = true;

    # Portal is required by flatpak
    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
        ];
    };
}
