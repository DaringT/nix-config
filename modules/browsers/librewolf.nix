{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    librewolf
  ];

  programs.librewolf = {
    enable = true;
    settings = {
      homepage = "https://start.librewolf.net/";
      "privacy.clearOnShutdown.history" = false;
      "privacy.donottrackheader.enabled" = true;
      "privacy.fingerprintingProtection" = true;
      "privacy.resistFingerprinting" = true;
      "privacy.trackingprotection.emailtracking.enabled" = true;
      "privacy.trackingprotection.enabled" = true;
      "privacy.trackingprotection.fingerprinting.enabled" = true;
      "privacy.trackingprotection.socialtracking.enabled" = true;

      # These are unique preferences from your original config:
      "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
      "cookiebanners.service.mode" = 2; # Block cookie banners
    };

    policies = {
    ExtensionSettings = {
      # uBlock Origin
      "uBlock0@raymondhill.net" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        installation_mode = "force_installed";
      };
      
      # Dark Reader
      "addon@darkreader.org" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
        installation_mode = "force_installed";
      };
      
      # The Camelizer (You may need to verify the ID for your locale/version)
      "the-camelizer-price-history-ch@camelcamelcamel.com" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/the-camelizer-price-history-ch/latest.xpi";
        installation_mode = "force_installed";
      };
      
      # Return YouTube Dislikes (ID from the Add-on page URL)
      "{4624d776-be1a-4720-af5c-3a31c1815ccf}" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislike/latest.xpi";
        installation_mode = "force_installed";
      };

      # Optional: Block all other extensions by default
      # "*" = {
      #   installation_mode = "blocked";
      # };
    };
    
    # Optional: Configure the default profile
    # You may also add custom settings here if desired
    profiles.default = {
      isDefault = true;
    };
  }; # The 'extensions' attribute handles declarative extension installation

      };

}
  #  package = pkgs.librewolf;
  #  policies = {
  #    DisableTelemetry = true;
  #    DisableFirefoxStudies = true;
  #    Preferences = {
  #      "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
  #      "cookiebanners.service.mode" = 2; # Block cookie banners
  #      "privacy.donottrackheader.enabled" = true;
  #      "privacy.fingerprintingProtection" = true;
  #      "privacy.resistFingerprinting" = true;
  #      "privacy.trackingprotection.emailtracking.enabled" = true;
  #      "privacy.trackingprotection.enabled" = true;
  #      "privacy.trackingprotection.fingerprinting.enabled" = true;
  #      "privacy.trackingprotection.socialtracking.enabled" = true;
  #    };
  #     ExtensionSettings = with builtins;
  #       let extension = shortId: uuid: {
  #         name = uuid;
  #         value = {
  #           install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
  #           installation_mode = "normal_installed";
  #         };
  #       };
  #       in listToAttrs [
  #         (extension "ublock-origin" "uBlock0@raymondhill.net")
  #         (extension "uaswitcher" "user-agent-switcher@ninetailed.ninja")
  #         (extension "darkreader" "addon@darkreader.org")
  #         (extension "plasma-integration" "plasma-browser-integration@kde.org")
  #         (extension "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" "return-youtube-dislikes")
  #         (extension "the-camelizer-price-history-ch" "izer@camelcamelcamel.com")

  #       ];
  #       # To add additional extensions, find it on addons.mozilla.org, find
  #       # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
  #       # Then, download the XPI by filling it in to the install_url template, unzip it,
  #       # run `jq .browser_specific_settings.gecko.id manifest.json` or
  #       # `jq .applications.gecko.id manifest.json` to get the UUID
  #     };
  #   };
# }
