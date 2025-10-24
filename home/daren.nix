# In your /etc/nixos/home/daren.nix

{ config, pkgs, lib, ... }:

{
  # Specify the Home Manager version corresponding to your flake input
  home.stateVersion = "24.05"; 
  
  # 1. Shell Configuration
  programs.bash.enable = true;
  
  # 2. Package Management (replacing the old users.users.daren.packages)
  home.packages = with pkgs; [
    # Applications (managed by Home Manager)
    kdePackages.kate
    obsidian
    vlc
    makemkv
    yt-dlp
    
    # Other user-level tools
    fastfetch 
    mpv
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