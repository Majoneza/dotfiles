{ ... }:
{
    services.flatpak = {
        packages = [
            # Browsers
            { appId = "org.chromium.Chromium"; origin = "flathub"; }
            { appId = "org.mozilla.firefox"; origin = "flathub"; }
            # Reading
            { appId = "com.calibre_ebook.calibre"; origin = "flathub"; } # eBook manager and reader
            { appId = "com.github.johnfactotum.Foliate"; origin = "flathub"; } # eBook reader
            # Research
            { appId = "org.zotero.Zotero"; origin = "flathub"; } # Reference management
            # Messaging
            { appId = "im.riot.Riot"; origin = "flathub"; } # Element messanger
            # Configuration
            { appId = "com.github.tchx84.Flatseal"; origin = "flathub"; } # Flatpaks manager
            # Development
            { appId = "com.visualstudio.code"; origin = "flathub"; } # Code editor
            { appId = "org.texstudio.TeXstudio"; origin = "flathub"; } # LaTex editor
            { appId = "org.gaphor.Gaphor"; origin = "flathub"; } # UML modeling
            { appId = "org.kicad.KiCad"; origin = "flathub"; } # EDA tool
            { appId = "org.kde.okteta"; origin = "flathub"; } # Hex editor
            # { appId = "org.freecad.FreeCAD"; origin = "flathub"; } # CAD program
            # { appId = "org.gnome.meld"; origin = "flathub"; } # Diff and merge tool
            # Development SDK
            { appId = "runtime/org.freedesktop.Sdk.Extension.rust-stable/x86_64/24.08"; origin = "flathub"; }
            { appId = "runtime/org.freedesktop.Sdk.Extension.golang/x86_64/24.08"; origin = "flathub"; }
            { appId = "runtime/org.freedesktop.Sdk.Extension.texlive/x86_64/24.08"; origin = "flathub"; }
            # Gaming
            { appId = "com.valvesoftware.Steam"; origin = "flathub"; } # Games store
            { appId = "org.prismlauncher.PrismLauncher"; origin = "flathub"; } # Minecraft launcher
            # Utility
            { appId = "org.kde.filelight"; origin = "flathub"; } # Disk usage analyzer
            { appId = "md.obsidian.Obsidian"; origin = "flathub"; } # Writing
            { appId = "com.github.xournalpp.xournalpp"; origin = "flathub"; } # Handwriting
            { appId = "io.github.alainm23.planify"; origin = "flathub"; } # Day planning
            { appId = "org.jousse.vincent.Pomodorolm"; origin = "flathub"; } # Time management
            { appId = "org.localsend.localsend_app"; origin = "flathub"; } # Send files locally
            { appId = "io.github.Qalculate"; origin = "flathub"; } # Calculator
            { appId = "org.kde.krdc"; origin = "flathub"; } # Remote desktop
            { appId = "com.jeffser.Alpaca"; origin = "flathub"; } # Ollama client
            { appId = "com.github.jeromerobert.pdfarranger"; origin = "flathub"; } # PDF editor
            # Drawing
            { appId = "org.kde.krita"; origin = "flathub"; }
            # Office
            { appId = "org.libreoffice.LibreOffice"; origin = "flathub"; }
            # Sound
            { appId = "io.github.dimtpap.coppwr"; origin = "flathub"; }
        ];
        overrides = {
            "com.visualstudio.code".Environment = {
                FLATPAK_ENABLE_SDK_EXT = "rust-stable,golang";
            };
        };
    };
}
