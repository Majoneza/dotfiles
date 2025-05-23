{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        chkrootkit # command: chkrootkit
        gnused     # for chkrootkit
    ];
}
