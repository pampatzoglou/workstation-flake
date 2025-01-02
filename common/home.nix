{ config, pkgs, ... }:

{
  # Import our common packages
  imports = [ ./packages.nix ];

  # Home Manager needs a bit of information about you and the paths it should manage
  home = {
    username = config.home.username;
    homeDirectory = "/home/${config.home.username}";
    
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    stateVersion = "23.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable direnv with nix support
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Additional environment variables
  home.sessionVariables = {
    EDITOR = "code --wait";
    VISUAL = "code --wait";
    KUBE_EDITOR = "code --wait";
    DOCKER_BUILDKIT = "1";
  };

  # XDG Base Directory specification
  xdg = {
    enable = true;
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    cacheHome = "${config.home.homeDirectory}/.cache";
  };
}
