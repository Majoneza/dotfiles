{ pkgs, ... }:
{
    # Enable OpenCL, OpenGL, VAAPI
    hardware.graphics = {
        extraPackages = with pkgs; [
            intel-media-driver
            vpl-gpu-rt
        ];
    };
}
