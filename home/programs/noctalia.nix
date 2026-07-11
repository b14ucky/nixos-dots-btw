{ ... }:

{
  programs.noctalia = {
    enable = true;

    settings = {
      audio.enable_overdrive = true;
      brightness.enable_ddcutil = true;
      location.auto_locate = true;
      nightlight.enabled = true;

      idle = {
        behavior_order = [ "lock" ];

        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600.0;
          };
        };
      };
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Tokyo-Night";
      };

      wallpaper = {
        enabled = true;
      };

      bar.default = {
        margin_edge = 5;
        margin_ends = 5;
        margin_opposite_edge = 5;
        widget_spacing = 15;

        start = [ "workspaces" ];
        center = [ "media" ];
        end = [
          "date"
          "clock"
          "network"
          "bluetooth"
          "volume"
          "brightness"
          "battery"
          "session"
        ];
      };

      shell = {
        launcher = {
          session_search = true;
          categories = false;
        };

        panel.open_near_click_control_center = true;
        screen_corners.enabled = true;
      };

      widget = {
        date.format = "{:%d/%m %a}";

        media.title_scroll = "always";

        network.show_label = false;

        volume.scale = 0.95;
      };

      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;

        widget_order = [
          "lockscreen-widget-0000000000000001"
          "lockscreen-widget-0000000000000002"
          "lockscreen-widget-0000000000000003"
        ];

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget = {
          "lockscreen-widget-0000000000000001" = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 1280.0;
            cy = 720.0;
            rotation = 0.0;
            type = "fancy_audio_visualizer";

            settings = {
              background = false;
              fade_when_idle = true;
              visualization_mode = "bars_rings";
            };
          };

          "lockscreen-widget-0000000000000002" = {
            box_height = 320.0;
            box_width = 784.0;
            cx = 1280.0;
            cy = 352.0;
            rotation = 0.0;
            type = "clock";

            settings = {
              background = false;
              clock_style = "digital";
              font_family = "";
            };
          };

          "lockscreen-widget-0000000000000003" = {
            box_height = 64.0;
            box_width = 128.0;
            cx = 2480.0;
            cy = 1390.0;
            rotation = 0.0;
            type = "weather";

            settings.background = false;
          };
        };
      };
    };
  };
}
