{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # YubiKey
    yubikey-personalization
    yubikey-manager
    yubico-piv-tool
    pam_u2f
    gnupg
    pinentry

    # Security Tools
    teleport
    aikido
    teller
  ];

  # Enable smartcard daemon for YubiKey
  services.pcscd.enable = true;

  # Configure GPG agent for YubiKey
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gtk2";
  };

  # Configure PAM for YubiKey authentication
  security.pam.u2f.enable = true;
  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
  };
}
