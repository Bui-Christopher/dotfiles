{ ... }:

{
    programs.firefox = {
        enable = true;
        policies = {
            EnableTrackingProtection = {
              Cryptomining = true;
              Fingerprinting = true;
              Locked = true;
              Value = true;
            };
            DisableAccounts = true;
            DisableFirefoxAccounts = true;
            DisableFirefoxScreenshots = true;
            DisableFirefoxStudies = true;
            DisablePocket = true;
            DisableTelemetry = true;
            DisplayBookmarksToolbar = "newtab"; # "always" | "newtab" | "never"
            DisplayMenuBar = "default-off"; # "always" | "never" | "default-on"
            DontCheckDefaultBrowser = true;
            OverrideFirstRunPage = "";
            OverridePostUpdatePage = "";
            # SearchBar = "unified"; # "unified" | "separate"

            # NOTE: Used the search api to find GUID
            # https://addons.mozilla.org/api/v5/addons/search/?q=bit-warden-manager
            ExtensionSettings = {
                "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
                # Bit Warden
                "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
                    installation_mode = "force_installed";
                };
                # Dark Reader
                "{b45a31f1-88f3-448f-a673-d42333ad06fb}" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
                    installation_mode = "force_installed";
                };
                # Privacy Badger
                "jid1-MnnxcxisBPnSXQ@jetpack" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
                    installation_mode = "force_installed";
                };
                # SponserBlock
                "sponsorBlocker@ajay.app" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
                    installation_mode = "force_installed";
                };
                # uBlock Origin
                "uBlock0@raymondhill.net" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                    installation_mode = "force_installed";
                };
            };
        };
    };
}
