{ lib }:
let
    libraries = [
        "strings"
        "path"
    ];
in
builtins.listToAttrs (
    lib.lists.forEach libraries (n: {
        name = "${n}";
        value = import (lib.path.append ./. n) { inherit lib; };
    })
)
