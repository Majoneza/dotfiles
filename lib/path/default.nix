{ lib }:
{
    appendForEach = p: builtins.map (lib.path.append p);
}
