{ ... }:
{
  imports = [
    ./modules/shells/fish.nix
    ./modules/programs/cli/bat.nix
    ./modules/programs/cli/btop.nix
    ./modules/programs/cli/eza.nix
    ./modules/programs/cli/fastfetch.nix
    ./modules/programs/cli/git.nix
    ./modules/programs/cli/neovim.nix
    ./modules/programs/cli/tmux.nix
    ./modules/programs/cli/wget.nix
    ./modules/programs/cli/yazi.nix
    ./modules/programs/cli/zip.nix
    ./modules/programs/cli/zoxide.nix

    ./modules/programs/gui/firefox.nix
    ./modules/programs/gui/google-chrome.nix
    ./modules/programs/gui/kitty.nix
  ];

  home.username = "matheo";
  home.homeDirectory = "/home/matheo";

  home.stateVersion = "25.05";
}
