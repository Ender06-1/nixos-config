{
  flake.modules.homeManager.shell = {
    programs.fish = {
      enable = true;
      generateCompletions = false;
      interactiveShellInit = ''
        set fish_greeting
      '';

      shellAliases = {
        nvimf = "nvim (fzf)";
      };
    };

    xdg = {
      enable = true;
      configFile = {
        "fish/conf.d" = {
          source = ./configs/fish/conf.d;
          recursive = true;
        };
        "fish/functions" = {
          source = ./configs/fish/functions;
          recursive = true;
        };
      };
    };
  };
}
