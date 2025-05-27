{ ... }:
{
    programs.aria2 = {
        enable = true;
        settings = {
            log-level = "info";
            split = 24;
            continue = true;
            check-integrity = true;
            max-concurrent-downloads = 50;
            max-connection-per-server = 8;
            max-file-not-found = 3;
            max-tries = 5;
            retry-wait = 60;
            ftp-pasv = true;
            bt-max-peers = 100;
            check-certificate = true;
            max-download-limit = 0;
            seed-ratio = 1;
            allow-overwrite = false;
            always-resume = true;
            auto-file-renaming = false;
        };
    };
}
