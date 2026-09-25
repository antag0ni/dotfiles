{ config, pkgs, ... }:

{
  # =========================================
  # IMPORTS
  # =========================================
  imports = [
    # ./hardware-configuration.nix
    /etc/nixos/hardware-configuration.nix
  ];

  # =========================================
  # BOOTLOADER
  # =========================================
  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.default = "saved";
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;

  # =========================================
  # HARDWARE
  # =========================================
  # Pass custom AMD debug mask to the kernel via GRUB
  boot.kernelParams = [ "amdgpu.dcdebugmask=0x10" ];
  hardware.alsa.enablePersistence = true;
  time.hardwareClockInLocalTime = true;

  # =========================================
  # NETWORKING
  # =========================================
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # =========================================
  # LOCALIZATION (TIMEZONE & LANGUAGE)
  # =========================================
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "it_IT.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  services.xserver.xkb = {
    layout = "it";
    variant = "";
  };

  console.keyMap = "it2";

  # =========================================
  # DESKTOP ENVIRONMENT
  # =========================================
  services.displayManager.gdm.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "antagoni";
  # services.desktopManager.gnome.enable = true;

  # =========================================
  # AUDIO, PRINTING & PERIPHERALS
  # =========================================
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  services.printing.enable = true;

  # Wayland output manager daemon
  services.kanshi.enable = true;

  # =========================================
  # USERS
  # =========================================
  users.users."antagoni" = {
    isNormalUser = true;
    description = "antagoni";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # =========================================
  # PACKAGES, FONTS & PROGRAMS
  # =========================================
  # --- HOW TO ENABLE NIXOS UNSTABLE ---
  # 1. sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
  # 2. sudo nix-channel --update
  # 3. sudo nixos-rebuild switch --upgrade
  # ------------------------------------

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs = {
    niri.enable = true;
    noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
    firefox.enable = true;
    neovim.enable = true;
    tmux.enable = true;
    localsend.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    alsa-utils
    fastfetch
    alacritty
    git
    btop
    xwayland-satellite
    wl-clipboard
    curl
    unzip
    brightnessctl
    stow
    nautilus
    kdePackages.okular
  ];

  # =========================================
  # ENVIRONMENT VARIABLES & ALIASES
  # =========================================
  environment.shellAliases = {
    nixedit = "sudo nvim /etc/nixos/configuration.nix";
    nixup = "sudo nixos-rebuild switch";
  };

  # =========================================
  # GARBAGE COLLECTION
  # =========================================
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  
  # Optimize nix store (symlinks identical files to save space)
  nix.settings.auto-optimise-store = true;

  # =========================================
  # SYSTEM STATE (DO NOT TOUCH)
  # =========================================
  system.stateVersion = "26.05"; 
}
