{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # System Tools
    gnome.gnome-tweaks
    timeshift
    htop
    atop
    iotop
    jq
    yq
    direnv
    neofetch

    # File Management
    dolphin
    ark
    unzip
    
    # Git and Version Control
    git
    gnupg  # For GPG signing
    pre-commit
  ];

  # Configure Git to use GPG signing
  programs.git = {
    enable = true;
    config = {
      commit.gpgsign = true;
      gpg.program = "${pkgs.gnupg}/bin/gpg2";
    };
  };
}
