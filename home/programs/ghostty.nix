{ ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      window-padding-x = 12;
      window-padding-y = 12;

      cursor-style = "block";
      cursor-style-blink = "false";
      theme = "TokyoNight Night";

      font-family = "JetBrainsMono Nerd Font";
      font-feature = [ "-calt" "-liga" "-dlig" ];

      shell-integration-features = "no-cursor";
    };
  };
}
