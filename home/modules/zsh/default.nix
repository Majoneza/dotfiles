{ pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        history = {
            size = 10000;
        };
        plugins = [
            {
                name = "zsh-syntax-highlighting";
                src = pkgs.fetchFromGitHub {
                    owner = "zsh-users";
                    repo = "zsh-syntax-highlighting";
                    rev = "0.8.0";
                    sha256 = "iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
                };
            }
            {
                name = "zsh-autosuggestions";
                src = pkgs.fetchFromGitHub {
                    owner = "zsh-users";
                    repo = "zsh-autosuggestions";
                    rev = "v0.7.0";
                    sha256 = "KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
                };
            }
            {
                name = "zsh-completions";
                src = pkgs.fetchFromGitHub {
                    owner = "zsh-users";
                    repo = "zsh-completions";
                    rev = "0.35.0";
                    sha256 = "GFHlZjIHUWwyeVoCpszgn4AmLPSSE8UVNfRmisnhkpg=";
                };
            }
            {
                name = "nix-zsh-completions";
                src = pkgs.fetchFromGitHub {
                    owner = "nix-community";
                    repo = "nix-zsh-completions";
                    rev = "0.5.1";
                    sha256 = "bgbMc4HqigqgdkvUe/CWbUclwxpl17ESLzCIP8Sz+F8=";
                };
            }
        ];
    };
}
