{ pkgs, ... }:
{
    # Enable OpenCL, OpenGL, VAAPI
    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            intel-media-driver
            vpl-gpu-rt
        ];
    };
}
