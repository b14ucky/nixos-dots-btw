{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot.enable = false;

    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = false;
    };
  };
  
  boot.loader.grub.extraEntries = ''
    menuentry "Arch Linux" {
      insmod fat
      insmod ext2

      search --fs-uuid --set=root 8CA8-7DDB

      linux /vmlinuz-linux root=UUID=ae12f114-172d-4eea-8982-d690bd3cfa90 rw
      initrd /initramfs-linux.img
    }
  '';

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = [ pkgs.terminus_font ];
  };

  networking.hostName = "nixos-btw";

  networking.networkmanager.enable = true;
  
  services.create_ap = {
    enable = true;
    settings = {
      INTERNET_IFACE = "enp6s0";
      WIFI_IFACE = "wlp0s20f3";
      SSID = "i use nixos btw";
      PASSPHRASE = "j@np@wel2";
    };
  };

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = false;

  # services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "caps:swapescape";

  programs.niri.enable = true;

  services.greetd = {
    enable = true;
    
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";

      user = "greeter";
    };
  };

  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchDocked = "ignore";
    HandleLidSwitchExternalPower = "ignore";
  };

  hardware.graphics.enable = true;

  hardware.bluetooth = {
    enable = true;

    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  services.blueman.enable = true;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;

    wireplumber.enable = true;

    extraConfig.pipewire."92-bluetooth" = {
      "context.properties" = {
        "bluez5.enable-msbc" = true;
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.codecs" = [ "sbc" "sbc_xq" "aac" "ldac" "aptx" "aptx_hd" ];
      };
    };
  };

  security.polkit.enable = true;

  services.gnome.gnome-keyring.enable = true;

  programs.zsh.enable = true;
  
  users.users."dominik-btw" = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ 
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "bluetooth"
    ];
  };

  programs.git.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];

    config.common.default = [ "gnome" "gtk" ];
  };

  environment.systemPackages = with pkgs; [
    git
    vim-full
    wget
    os-prober
    xwayland-satellite
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];

    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  programs.nix-ld.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05"; # Did you read the comment?
}

