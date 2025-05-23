{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        vulnix # command: vulnix --system
    ];
}
