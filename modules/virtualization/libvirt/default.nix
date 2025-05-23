{ pkgs, ... }:
{
    # Enable libvirtd
    virtualisation = {
        libvirtd.enable = true;
    };

    # Install virt-manager
    programs.virt-manager.enable = true;

    # Install virt-viewer for multi-monitor virtualization
    environment.systemPackages = with pkgs; [
        virt-viewer
    ];
}
