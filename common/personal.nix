{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Browsers
    brave
    chromium

    # Cloud Storage
    pcloud

    # Communication & Productivity
    slack
    zoom-us
    libreoffice
    postman

    # Media & Entertainment
    vlc
    spotify

    # Personal Development Tools
    obsidian
    typora
  ];
}
