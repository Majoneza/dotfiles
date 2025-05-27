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

    # Open firewall ports
    networking = {
        firewall = {
            # Expose the most commonly used port
            #       for development applications
            interfaces."docker0".allowedTCPPorts = [
                8989
            ];
        };
    };

    # Enable nvidia PRIME
    hardware.nvidia.prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
    };

    # Set your time zone.
    time.timeZone = "Europe/Zagreb";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "hr_HR.UTF-8";
        LC_IDENTIFICATION = "hr_HR.UTF-8";
        LC_MEASUREMENT = "hr_HR.UTF-8";
        LC_MONETARY = "hr_HR.UTF-8";
        LC_NAME = "hr_HR.UTF-8";
        LC_NUMERIC = "hr_HR.UTF-8";
        LC_PAPER = "hr_HR.UTF-8";
        LC_TELEPHONE = "hr_HR.UTF-8";
        LC_TIME = "hr_HR.UTF-8";
    };

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
        motd = "Welcome user";
    };

    environment.systemPackages = with pkgs; [
        wget
        gparted
        gcc
        gdb
        socat
        git
        #edk2-uefi-shell
    ];
}
