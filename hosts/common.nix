{ myLib, username, devname, ... }:
{
    # Nix settings
    nix = {
        settings = {
            auto-optimise-store = true;
            # Enable the flakes feature
            experimental-features = [ "nix-command" "flakes" ];
        };
        optimise.automatic = true;
    };

    # Enable networking and firewall
    networking = {
        hostName = "${devname}";
        networkmanager.enable = true;
        firewall = {
            enable = true;
        };
    };

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Use the faster dbus implementation
    services.dbus.implementation = "broker";

    # Better audio
    security.rtkit.enable = true;

    # Disable sudo because we can use run0
    security.sudo.enable = false;

    # Enable TPM because it comes standard
    security.tpm2.enable = true;

    # Windows-like authentication experience
    security.polkit.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users = {
        users."${username}" = {
            isNormalUser = true;
            description = myLib.strings.capitalize username;
        };
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?
}
