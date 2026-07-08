{ ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      window-padding-x = 12;
      window-padding-y = 12;

      cursor-style = "block";
      cursor-style-blink = "false";

      shell-integration-features = "no-cursor";
    };
  };
}
