{ pkgs, ... }:
{
    # Install zsh
    programs.zsh = {
        enable = true;
        # We disable global completion because we usually have completion enabled in home-manager.
        #   If we enable completion on both sides than zsh will take twice as long to start due to
        #   having to execute "compinit" twice.
        enableCompletion = false;
    };

    # Set zsh as default
    users.defaultUserShell = pkgs.zsh;

    # Required to add zsh as default
    environment = {
        # Add zsh to shells
        shells = with pkgs; [
            zsh
        ];

        # To allow for programs.zsh.enableCompletion
        pathsToLink = [ "/share/zsh" ];
    };
}
