{ ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    enableCompletion = true;

    initContent = "fastfetch";

    oh-my-zsh = {
      enable = true;
      theme = "";
      plugins = [
        "git"
        "sudo"
        "docker"
        "history-substring-search"
      ];
    };

    shellAliases = {
      ls = "eza -lh --group-directories-first --icons=auto";
      ll = "eza -al --group-directories-first --icons=always";
      lt = "eza -a --tree --level=2 --icons=always";

      cd = "z";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      cf = "clear && fastfetch";
    };

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      share = true;
    };
  };
}
