{ pkgs, ... }:
{
    programs.vscode = {
        enable = true;
        mutableExtensionsDir = false;
        haskell.enable = true;
        profiles = {
            "Default" = {
                enableExtensionUpdateCheck = false;
                enableUpdateCheck = false;
                extensions = with pkgs.vscode-extensions; [
                    # C/C++
                    llvm-vs-code-extensions.vscode-clangd
                    vadimcn.vscode-lldb
                    # Rust
                    rust-lang.rust-analyzer
                    tamasfe.even-better-toml
                    # Nix
                    jnoortheen.nix-ide
                    # Python
                    ms-python.python
                    ms-python.vscode-pylance
                    ms-python.debugpy
                    charliermarsh.ruff
                    njpwerner.autodocstring
                    # Markdown
                    yzhang.markdown-all-in-one
                    shd101wyy.markdown-preview-enhanced
                    # Git
                    eamodio.gitlens
                    # Icons
                    vscode-icons-team.vscode-icons
                    # SSH
                    ms-vscode-remote.remote-ssh
                    # Paths
                    christian-kohler.path-intellisense
                    # Dotenv
                    mikestead.dotenv
                    # TODOs
                    gruntfuggly.todo-tree
                    # Errors
                    usernamehw.errorlens
                ];
                globalSnippets = {
                    "Dirname camelcase" = {
                        prefix = "dir";
                        body = [
                            "\${TM_DIRECTORY/^.+[\\/\\\\]+(.*)$/\${1:/camelcase}/}"
                        ];
                    };
                    "Filename camelcase" = {
                        prefix = "file";
                        body = [
                            "\${TM_FILENAME_BASE/(.*)/\${1:/camelcase}/}"
                        ];
                    };
                    "Dirname pascalcase" = {
                        "prefix" = "Dir";
                        "body" = [
                            "\${TM_DIRECTORY/^.+[\\/\\\\]+(.*)$/\${1:/pascalcase}/}"
                        ];
                    };
                    "Filename pascalcase" = {
                        prefix = "File";
                        body = [
                            "\${TM_FILENAME_BASE/(.*)/\${1:/pascalcase}/}"
                        ];
                    };
                };
                keybindings = [
                ];
                languageSnippets = {
                };
                userSettings = {
                    "workbench.iconTheme" = "vscode-icons";
                };
                userTasks = {
                    version = "2.0.0";
                    tasks = [
                    ];
                };
            };
        };
    };
}
