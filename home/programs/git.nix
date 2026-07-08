{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Dominik Meisner";
        email = "meisnerd2003@gmail.com";
        signingkey = "/home/dominik-btw/.ssh/id_ed25519.pub";
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
        allowedSignersFile = "/home/dominik-btw/.config/git/allowed_signers";
      };
    };
  };
}

