{ config, pkgs, ... }:

{
  # Import hardware configuration
  imports = [ ./hardware-configuration.nix ];

  # Use the systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking = {
    hostName = "devops-workstation";
    networkmanager.enable = true;
    wireless.enable = true;
  };

  # Set your time zone
  time.timeZone = "Europe/Athens";

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable Docker
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
    # Enable KVM/QEMU
    libvirtd.enable = true;
  };

  # System packages specific to NixOS
  environment.systemPackages = with pkgs; [
    # System utilities
    pciutils
    usbutils
    lshw
    dmidecode
    
    # Security & Authentication
    yubikey-manager
    yubikey-personalization
    pam_u2f
    
    # GUI applications
    firefox
    chromium
    gnome.gnome-terminal
  ];

  # Enable OpenSSH daemon
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # Enable VSCode Server
  services.vscode-server.enable = true;

  # Enable the X11 windowing system
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Enable Yubikey support
  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.pcscd.enable = true;

  # User account
  users.users.pantelis = {
    isNormalUser = true;
    extraGroups = [ 
      "wheel"  # Enable sudo
      "networkmanager"
      "docker"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

  # Enable automatic system upgrades
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };

  # Garbage collection
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # This value determines the NixOS release with which your system is to be compatible
  system.stateVersion = "23.11";
}