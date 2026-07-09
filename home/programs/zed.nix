{ ... }:

{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "pyrefly"
      "macos-classic"
    ];

    userSettings = {
      
      vim_mode = true;
      disable_ai = true;

      cli_default_open_behavior = "existing_window";

      project_panel.dock = "left";
      outline_panel.dock = "left";
      collaboration_panel.dock = "left";
      git_panel.dock = "left";

      languages = {
        Python = {
          language_servers = ["pyrefly" "ruff" "!basedpyright" ];
          inlay_hints.enabled = false;
        };
      };

      vim.toggle_relative_line_numbers = true;
      extend_comment_on_newline = false;
      session.trust_all_worktrees = true;

      ui_font_size = 16;
      buffer_font_size = 18;

      icon_themes = {
        mode = "dark";
        light = "Zed (Default)";
        dark = "Zed (Default)";
      };
      
      theme = {
        mode = "dark";
        light = "macOS Classic Light";
        dark = "macOS Classic Dark";
      };
    };
  };
}
