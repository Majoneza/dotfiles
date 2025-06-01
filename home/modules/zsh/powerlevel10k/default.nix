{ pkgs, lib, ... }:
{
    programs.zsh = {
        initContent = lib.mkAfter "source \"$HOME/.config/.p10k.zsh\"";
        plugins = lib.mkAfter [
            {
                name = "powerlevel10k";
                file = "powerlevel10k.zsh-theme";
                src = pkgs.fetchFromGitHub {
                    owner = "romkatv";
                    repo = "powerlevel10k";
                    rev = "v1.20.0";
                    sha256 = "ES5vJXHjAKw/VHjWs8Au/3R+/aotSbY7PWnWAMzCR8E=";
                };
            }
        ];
    };

    xdg.configFile.".p10k.zsh" = {
        enable = true;
        source = ./.p10k.zsh;
    };
}
