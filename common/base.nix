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
  ];
}
