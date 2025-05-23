{ ... }:
{
    services.clamav = {
        daemon.enable = true;
        fangfrisch.enable = true;
        fangfrisch.interval = "daily";
        scanner.enable = true;
        scanner.interval = "Sat *-*-* 04:00:00";
        updater.enable = true;
        updater.interval = "daily"; # man systemd.time
        updater.frequency = 12;
    };
}
