{ config, pkgs, ... }:


{
  programs.helium = {
  enable = true;

  # CLI flags passed to the browser
  # commandLineArgs = [
  #   "--ozone-platform-hint=auto"
  #   "--enable-features=WaylandWindowDecorations"
  #   "--enable-wayland-ime=true"
  # ];

  # Chrome Web Store extensions (installed via Helium's privacy proxy)
  extensions = [
    # { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
    # { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
  ];

  # Local CRX extension
  # extensions = [{
  #   id = "aaaaaaaaaabbbbbbbbbbccccccccccdd";
  #   crxPath = "/path/to/extension.crx";
  #   version = "1.0";
  # }];

  # dictionaries = [ pkgs.hunspellDictsChromium.en_US ];
  # nativeMessagingHosts = [ pkgs.browserpass ];
};
}