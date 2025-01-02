{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Development Tools
    git
    vscode
    gh  # GitHub CLI

    # Programming Languages & Tools
    go
    python3
    nodejs
    yarn
    rustup

    # Database Tools
    pgcli
    mycli
    mongosh

    # API Development
    grpcurl
    postman

    # Password Management
    keepassxc

    # Git Configuration for YubiKey
    gnupg  # For GPG signing
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
