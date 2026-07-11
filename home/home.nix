{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    inputs.zen-browser.homeModules.twilight

    ./programs/git.nix
    ./programs/ghostty.nix
    ./programs/zsh.nix
    ./programs/starship.nix
    ./programs/terminal-tools.nix
    ./programs/zed.nix
    ./programs/python.nix
    ./programs/direnv.nix
  ];

  home.username = "dominik-btw";
  home.homeDirectory = "/home/dominik-btw";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    ghostty

    wl-clipboard
    grim
    slurp
    brightnessctl
    playerctl

    spotify
    vesktop

    (writeShellScriptBin "pbcopy" ''
      exec ${wl-clipboard}/bin/wl-copy "$@"
    '')

    (writeShellScriptBin "pbpaste" ''
      exec ${wl-clipboard}/bin/wl-paste "$@"
    '')
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  programs.noctalia = {
    enable = true;
  };

  xdg.configFile."niri/config.kdl".source = ./config/niri/config.kdl;
  
  home.stateVersion = "26.05";
}
