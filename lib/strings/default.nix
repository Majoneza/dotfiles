{ lib }:
{
    capitalize = s: (lst: lib.concatStrings ([(lib.toUpper (builtins.head lst))] ++ builtins.tail lst)) (lib.stringToCharacters s);
}
