{ config, pkgs, ... }: # Ensure 'config' is available if you use other parts of the module
{
  programs.lsd = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    
    settings = {
      blocks = [
        "permission"
        "user"
        "group"
        "date"
        "git"
        "name"
      ];
      # This is correct and crucial
      color.theme = "custom"; 
      icons.when = "always";
      symlink-arrow = "->";
    };
    
    # ⭐ ADD THIS SECTION AND REMOVE THE home.file BLOCK ⭐
    colors = {
      file-types = {
        # Directories
        directory = "blue bold";

        # Executable files
        executable = "green bold";

        # Symlinks (ln)
        symlink = "cyan bold";

        # Custom color for .py files
        ".py" = "yellow bold";

        # Specific extension: Markdown files
        ".md" = "magenta";
      };
      
      # You can add other color blocks here if needed (e.g., blocks, date)
      # blocks = { permission = "yellow"; ... };
    };
  };

  # ❌ REMOVE THIS BLOCK ENTIRELY: 
  # home.file.".config/lsd/colors.yaml".source = yamlFormat.generate "colors.yaml" { ... }
}
# {pkgs, ...}: let
#   yamlFormat = pkgs.formats.yaml {};
# in {
#   programs.lsd = {
#     enable = true;
#     enableBashIntegration = true;
#     enableZshIntegration = true;
#     settings = {
#       blocks = [
#         "permission"
#         "user"
#         "group"
#         "date"
#         "git"
#         "name"
#       ];
#       color = {theme = "custom";};
#       icons = {when = "always";};
#       symlink-arrow = "->";
#     };
#   };

#   home.file.".config/lsd/colors.yaml".source = yamlFormat.generate "colors.yaml" {
#     file-types = {
#       # Directories
#       ".py" = "yellow bold";
#       directory = "blue bold";

#       # Executable files
#       executable = "green bold";

#       # Symlinks (ln)
#       symlink = "cyan bold";
#       # Specific extension: Markdown files
#       ".md" = "magenta";
      
#     };
#     # user = "dark_yellow";
#     # group = "dark_yellow";
#     # permission = {
#     #   read = "dark_yellow";
#     #   write = "dark_magenta";
#     #   exec = "dark_red";
#     #   exec-sticky = "dark_blue";
#     #   no-access = "red";
#     #   octal = "dark_cyan";
#     #   acl = "dark_cyan";
#     #   context = "dark_cyan";
#     # };
#     # date = {
#     #   hour-old = "dark_cyan";
#     #   day-old = "dark_cyan";
#     #   older = "dark_cyan";
#     # };
#     # size = {
#     #   none = "dark_green";
#     #   small = "dark_green";
#     #   medium = "dark_green";
#     #   large = "dark_green";
#     # };
#     # inode = {
#     #   valid = "dark_magenta";
#     #   invalid = "red";
#     # };
#     # links = {
#     #   valid = "dark_blue";
#     #   invalid = "dark_red";
#     # };
#     # tree-edge = "dark_cyan";
#     # git-status = {
#     #   default = "dark_cyan";
#     #   unmodified = "dark_cyan";
#     #   ignored = "dark_cyan";
#     #   new-in-index = "dark_green";
#     #   new-in-workdir = "dark_green";
#     #   typechange = "dark_yellow";
#     #   deleted = "dark_red";
#     #   renamed = "dark_green";
#     #   modified = "dark_yellow";
#     #   conflicted = "dark_red";
#     # };
#   };
# }