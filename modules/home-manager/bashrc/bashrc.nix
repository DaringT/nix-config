{ config, pkgs, lib, ... }:

let
  # Packages required for your aliases and conditional scripts
  requiredPackages = with pkgs; [
    # lsd                 # for ls/ll/la/l/tree aliases
    # bat                 # for cat alias
    # lsscsi              # for disc-info alias
    # yt-dlp              # for yt alias
    # gnused              # for the 'alert' alias sed commands
    # libnotify           # provides notify-send for the 'alert' alias
    # lesspipe            # for less compatibility setup
    # coreutils           # provides dircolors
  ];

in

# home.file."~/.ls_colors.sh".source = ./.ls_colors.sh;
home.file.".ls_colors.sh".source = ./ls_colors.sh;



{
  # 1. Shell Program Setup and Options
  programs.bash = {
    enable = true;
    
    # initExtra = builtins.readFile './ls_colors.sh';
  
    # Corresponds to shopt -s histappend, checkwinsize, globstar
    shellOptions = [
      "histappend"
      "checkwinsize"
      "globstar"
    ];

    # History size variables (HISTSIZE and HISTFILESIZE)
    historySize = 1000;
    historyFileSize = 2000;
    
    # Bash completion
    enableCompletion = true;
  };


  # 2. Environment Variables
  home.sessionVariables = {
    # HISTCONTROL=ignoreboth
    HISTCONTROL = "ignoreboth";
    
    # colored GCC warnings and errors
    GCC_COLORS = "error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01";
    # PS1 = '\[\e[1;38;2;55;209;2m\]\u\[\e[38;2;169;169;169m\]\e[1;38;2;255;255;255m󱒜\[\e[1;38;2;55;209;2m\]\h\[\e[38;2;255;255;255m\]:\[\e[1;38;2;0;153;255m\]\w\[\e[38;2;255;0;0m\] 󰁔\[\e[0m\]'
    # PS1 = "\\[\\e[1;38;2;55;209;2m\\]\\u\\[\\e[38;2;169;169;169m\\]\\e[1;38;2;255;255;255m󱒜\\[\\e[1;38;2;55;209;2m\\]\\h\\[\\e[38;2;255;255;255m\\]:\\[\\e[1;38;2;0;153;255m\\]\\w\\[\\e[38;2;255;0;0m\\] 󰁔\\[\\e[0m\\]";
  };
  
  # 3. Path Management
  home.sessionPath = [ "/home/daren/.local/bin" ];

  # 4. Aliases (Crucial: must be 'aliases', not 'alias')
  programs.bash.shellAliases = {
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
    
    # # Alert Alias (using multiline string)
  };

  # 5. Packages
  home.packages = requiredPackages;

  # home.file."~/.ls_colors.sh".source = ./.ls_colors.sh;
  # 6. Remaining Scripts and Conditional Logic
  programs.bash.initExtra = ''
    PS1='\[\e[1;38;2;55;209;2m\]\u\[\e[38;2;169;169;169m\]\e[1;38;2;255;255;255m󱒜\[\e[1;38;2;55;209;2m\]\h\[\e[38;2;255;255;255m\]:\[\e[1;38;2;0;153;255m\]\w\[\e[38;2;255;0;0m\] 󰁔\[\e[0m\] ' 

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x ${pkgs.lesspipe}/bin/lesspipe ] && eval "$(${pkgs.lesspipe}/bin/lesspipe)"
    
    # enable color support of ls using dircolors
    if [ -x ${pkgs.coreutils}/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(${pkgs.coreutils}/bin/dircolors -b ~/.dircolors)" || eval "$(${pkgs.coreutils}/bin/dircolors -b)"
    fi
    
    # Alias definitions from a separate file
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    # Source external files
    # source ~/.ls_colors.sh
  '';
}