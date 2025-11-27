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

        # # Custom color for .py files
        # ".py" = "yellow bold";
        # ".zip" = "yellow";

        # # Specific extension: Markdown files
        # ".md" = "magenta";
      };
      
      # You can add other color blocks here if needed (e.g., blocks, date)
      # blocks = { permission = "yellow"; ... };
    };
  };

  # ❌ REMOVE THIS BLOCK ENTIRELY: 
  # home.file.".config/lsd/colors.yaml".source = yamlFormat.generate "colors.yaml" { ... }
}