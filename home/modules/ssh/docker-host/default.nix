{ lib, ... }:
{
    programs.ssh.extraConfig = lib.mkAfter ''
        Host docker
            HostName 172.17.0.2
            User root
            StrictHostKeyChecking no
            UserKnownHostsFile=/dev/null
    '';
}
