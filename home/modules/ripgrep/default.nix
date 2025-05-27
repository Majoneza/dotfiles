{ ... }:
{
    programs.ripgrep = {
        enable = true;
        arguments = [
            "--hidden"
            "--pretty"
        ];
    };
}
