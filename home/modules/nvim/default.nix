{ pkgs-unstable, ... }:
{
    # Enable nvim
    programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        package = pkgs-unstable.neovim-unwrapped;
    };

    # Create root config
    xdg.configFile."nvim" = {
        enable = true;
        recursive = true;
        source = ./config;
    };
}
