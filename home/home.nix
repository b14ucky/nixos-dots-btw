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
  ];

  home.username = "dominik-btw";
  home.homeDirectory = "/home/dominik-btw";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    ghostty

    mako
    swaylock
    swayidle
    wl-clipboard
    grim
    slurp

    spotify
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  programs.noctalia = {
    enable = true;
  };
  
  home.stateVersion = "26.05";
}
