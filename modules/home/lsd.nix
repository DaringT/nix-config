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
      symlink-arrow = "";
    };
    
    colors = {
      file-types = {
        directory = "blue bold";
        executable = "green bold";

        symlink = "cyan bold";

        # ".py" = "yellow bold";
        # ".zip" = "yellow";
        # ".md" = "magenta";
      };
    };
  };
}