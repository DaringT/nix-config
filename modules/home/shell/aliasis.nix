# aliasis.nix
{
  # ls/cat replacements
  lss = "ls";
  ls = "lsd";
  ll = "lsd -alF";
  lll = "lsd -1";
  la = "lsd -A";
  l = "lsd -CF";
  tree = "lsd --tree";
  cat = "bat";
  iso = "echo dd if=/dev/cdrom of=output.iso";
  flash = "echo dd of=/dev/sdc if=output.iso";

  # Directory/Navigation
  cd = "z";
  cdi = "zi";
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
}