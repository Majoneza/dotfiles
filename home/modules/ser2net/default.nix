{ ... }:
{
    # Create root config
    xdg.configFile."ser2net.yaml" = {
        enable = true;
        source = ./config/ser2net.yaml;
    };
}
