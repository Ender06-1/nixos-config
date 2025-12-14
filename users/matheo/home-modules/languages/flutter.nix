{ pkgs, ... }:
let
  CHROME_EXECUTABLE = "${pkgs.google-chrome}/bin/google-chrome-stable";
in
{
  programs.bash.sessionVariables = { inherit CHROME_EXECUTABLE; };

  programs.fish.interactiveShellInit = ''
    set -gx CHROME_EXECUTABLE ${CHROME_EXECUTABLE}
  '';
}
