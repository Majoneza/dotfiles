{ pkgs, lib, myLib, homeModules, ... }:
let
    modules = myLib.path.appendForEach homeModules [
        "alacritty"
        "flatpak"
        "git"
        "nvim"
        "zsh"
    ];
in
{
    imports = lib.lists.flatten [
        modules
        ./flatpak-packages.nix
    ];

    home.packages = with pkgs; [
        # Archives
        zip
        xz
        unzip

        # Monitoring
        htop

        # Manual
        tldr

        # Control
        brightnessctl

        # Miscellaneous
        file
        which
        tree

        # Language servers
        nil

        # Language formatters
        nixfmt-rfc-style

        # Fonts
        nerd-fonts.roboto-mono

        # Math
        sage
        cantor

        # Development
        devenv

        # Password management
        keepassxc
    ];
}
