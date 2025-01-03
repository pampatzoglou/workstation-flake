{ config, pkgs, ... }:

{
  # Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable Rosetta 2 for x86_64 support
  system.rosetta.enable = true;

  # Auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  # System-wide packages for macOS
  environment.systemPackages = with pkgs; [
    # System utilities
    coreutils
    gnused
    gnutar
    gawk
    findutils
    
    # Terminal utilities
    iterm2
  ];

  # Create /etc/zshrc that loads the nix-darwin environment
  programs.zsh.enable = true;

  # Enable touch ID for sudo
  security.pam.enableSudoTouchIdAuth = true;

  # Auto upgrade packages
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    interval = { Hour = 24; };
    options = "--delete-older-than 30d";
  };

  # System preferences
  system = {
    # Enable keyboard mapping
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
    
    # Dock settings
    defaults = {
      dock = {
        autohide = true;
        mru-spaces = false;
        minimize-to-application = true;
      };
      
      # Finder settings
      finder = {
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
      };
      
      # Global macOS settings
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
      };
    };
  };

  # Homebrew configuration
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    
    # Homebrew casks (GUI applications)
    casks = [
      "firefox"
      "google-chrome"
      "visual-studio-code"
      "docker"
      "lens"
      "postman"
      "obsidian"
    ];
    
    # Homebrew taps
    taps = [
      "homebrew/cask"
      "homebrew/core"
      "homebrew/services"
    ];
  };

  # This value determines the nix-darwin release with which your system is compatible
  system.stateVersion = 4;
}
