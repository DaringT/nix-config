{ config, pkgs, lib, ... }:

{

    programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 100000;
      save = 100000;
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
      extended = true;

      initContent = ''
      bindkey "^[[3~" delete-char
    '';
    };

    shellAliases = {
      # ls/cat replacements
      lss = lib.mkForce"ls"; # Original 'ls'
      ls = lib.mkForce"lsd";
      ll = lib.mkForce"lsd -alF";
      lll = lib.mkForce"lsd -1";
      # la = "lsd -A";
      la = lib.mkForce "lsd -A";
      l = lib.mkForce"lsd -CF";
      tree = lib.mkForce"lsd --tree";
      cat = "bat";
      iso = "echo dd if=/dev/cdrom of=output.iso";
      
      # Directory/Navigation
      "cd.." = "cd ..";
      nixos = "cd ~/nix-config";
      rn = "mv";

      # Python
      python = "python3";
      py = "python3";

      # Utilities
      "disc-info" = "lsscsi -g";
      cls = "clear";
      ipa = "hostname -I | awk '{print $1}'";

      # External Programs & Nix Management
      yt = "yt-dlp --cookies yt-cookies.txt -t mp3";
      hms = "home-manager switch --flake ~/nix-config#daren";
      nrs = "cd ~/nix-config && sudo nixos-rebuild switch --flake .#DJT-DESKTOP";
      nit = "cd ~/nix-config && git add -A && git commit -m";
      
      # Grep Colors
      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
      cb = "xclip -sel clip";
      # # Alert Alias (using multiline string)
    };

    programs.starship = {
      enable = true;
      # settings = builtins.fromTOML (builtins.readFile ./starship.toml);
      eval "$(starship init zsh)"
    };
}