{ pkgs, lib, ... }:
{
    # Allow nvidia unfree software
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "nvidia-x11"
        "nvidia-settings"
        "nvidia-persistenced"
    ];

    # Load nvidia driver
    services.xserver.videoDrivers = [
        "nvidia"
    ];

    # Enable VAAPI
    hardware.graphics = {
        extraPackages = with pkgs; [
            nvidia-vaapi-driver
        ];
    };

    # Enable nvidia driver
    hardware.nvidia = {
        open = true;
    };
}
