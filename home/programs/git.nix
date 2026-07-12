{ config, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Dominik Meisner";
        email = "meisnerd2003@gmail.com";
        signingkey = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      };

      gpg = {
        format = "ssh";
      };

      commit = {
        gpgsign = true;
      };

      init = {
        defaultBranch = "main";
      };

      gpg."ssh" = {
        allowedSignersFile = "${config.home.homeDirectory}/.config/git/allowed_signers";
      };
    };
  };
}

