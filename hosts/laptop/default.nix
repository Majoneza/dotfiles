{ pkgs, lib, myLib, sysModules, username, ... }:
let
    modules = myLib.path.appendForEach sysModules [
        "bootloader/systemd-boot"
        "desktop/kde"
        "graphics/intel-integrated"
        "graphics/nvidia"
        "network/bluetooth"
        "security/apparmor"
        "security/chkrootkit"
        "security/clamav"
        "security/fail2ban"
        "security/lynis"
        "security/vulnix"
        "services/flatpak"
        "shell/zsh"
        "virtualization/docker"
        "virtualization/libvirt"
        "virtualization/nvidia-ctk"
    ];
in
{
    imports = lib.lists.flatten [
        modules
    ];

    networking = {
        firewall = {
            # Expose the most commonly used port
            #       for development applications
            interfaces."docker0".allowedTCPPorts = [
                8989
            ];
        };
    };

    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;

    # Set your time zone.
    time.timeZone = "Europe/Zagreb";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    # Enable tablet driver
    services.xserver.wacom.enable = true;

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable power management
    services.upower.enable = true;

    # Enable firmware update service
    services.fwupd.enable = true;

    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users = {
        users."${username}" = {
            extraGroups = [
                "networkmanager" # Network management
                "dialout" # Serial device access
            ];
        };
    };

    environment.systemPackages = with pkgs; [
        wget
        gparted
        gcc
        gdb
        socat
        #edk2-uefi-shell
    ];
}
