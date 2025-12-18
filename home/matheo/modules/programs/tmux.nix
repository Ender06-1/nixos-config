{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    clock24 = true;
    mouse = true;
    resizeAmount = 10;
    shortcut = "s";
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins; [
      onedark-theme
    ];
  };
}
