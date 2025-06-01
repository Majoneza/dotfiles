{ pkgs, lib, myLib, homeModules, ... }:
let
    modules = myLib.path.appendForEach homeModules [
        "alacritty"
        "aria2"
        "flatpak"
        "git"
        "htop"
        "nvim"
        "ripgrep"
        "zsh"
        "zsh/direnv"
        "zsh/fzf"
        "zsh/pls"
        "zsh/powerlevel10k"
        "zsh/zoxide"
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

        # Math
        sage
        cantor

        # Development
        devenv

        # Password management
        keepassxc
    ];
}
