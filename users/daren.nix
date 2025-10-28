{ config, pkgs, lib, ... }:

{
  # Specify the Home Manager version corresponding to your flake input
  home.stateVersion = "24.05"; 
  
  # 1. Shell Configuration
  programs.bash.enable = true;
  
  # 2. Package Management (replacing the old users.users.daren.packages)
  home.packages = with pkgs; [
      kdePackages.kate
      kdePackages.elisa
      kdePackages.okular
      
      
      wineWowPackages.stable
      thunderbird
      obsidian
      onlyoffice-desktopeditors
      
      vesktop # discord client
      audacity
      vlc
      mpv
      krename
      makemkv
      virt-manager
      plasma-panel-colorizer
      mkvtoolnix
      remmina
      brave
      spotdl
      yt-dlp
      youtube-tui
  ];

  # 3. Environment variables or settings
  # home.sessionVariables = {
  #   EDITOR = "vim";
  # };
  
  # 4. Git configuration
  # programs.git = {
  #   enable = true;
  #   userName = "Daren Johnson";
  #   userEmail = "daren@example.com";
  # };

  # ... add configurations for programs like alacritty, tmux, neovim, etc.
}