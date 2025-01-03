{ config, pkgs, ... }: {
  # VSCode Extensions
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # Theme and UI
      dracula-theme.theme-dracula
      pkief.material-icon-theme
      
      # Git Integration
      eamodio.gitlens
      mhutchie.git-graph
      
      # Language Support
      ms-python.python
      golang.go
      rust-lang.rust-analyzer
      redhat.vscode-yaml
      hashicorp.terraform
      jnoortheen.nix-ide
      
      # Tools and Utilities
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      ms-azuretools.vscode-docker
      github.copilot
      github.copilot-chat
      
      # Remote Development
      ms-vscode-remote.remote-ssh
    ];
    userSettings = {
      "editor.formatOnSave" = true;
      "editor.rulers" = [ 80 120 ];
      "files.trimTrailingWhitespace" = true;
      "workbench.colorTheme" = "Dracula";
      "workbench.iconTheme" = "material-icon-theme";
    };
  };

  # Brave Browser Configuration
  programs.brave = {
    enable = true;
    extensions = [
      # Privacy and Security
      "gcbommkclmclpchllfjekcdonpmejbdp" # HTTPS Everywhere
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "pdffkfellgipmhklpdmokmckkkfcopbh" # KeePassXC-Browser
      "nkbihfbeogaeaoehlefnkodbefgpgknn" # MetaMask
      
      # Development
      "fmkadmapgofadopljbjfkapdkoienihi" # React Developer Tools
      "lmhkpmbekcpmknklioeibfkpmmfibljd" # Redux DevTools
      "aapbdbdomjkkjkaonfhkkikfgjllcleb" # Google Translate
      
      # Productivity
      "kgeglempfkhalebjlogemlmeakondflc" # Momentum
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "kbfnbcaeplbcioakkpcpgfkobkghlhen" # Grammarly
    ];
  };

  home = {
    username = "pantelis";
    homeDirectory = "/home/pantelis";
    stateVersion = "23.11";

    # Global gitignore file
    file.".gitignore_global".text = ''
      # OS generated files
      .DS_Store
      .DS_Store?
      ._*
      .Spotlight-V100
      .Trashes
      ehthumbs.db
      Thumbs.db

      # Editor directories and files
      .idea/
      .vscode/
      *.swp
      *.swo
      *~

      # Environment files
      .env
      .env.local
      .env.*

      # Build output
      dist/
      build/
      *.pyc
      __pycache__/
      .pytest_cache/
      coverage/
      .coverage

      # Dependency directories
      node_modules/
      vendor/
      .venv/
      venv/
    '';

    # Pre-commit hooks configuration
    file.".pre-commit-config.yaml".text = ''
      repos:
      - repo: https://github.com/pre-commit/pre-commit-hooks
        rev: v4.4.0
        hooks:
          - id: trailing-whitespace
          - id: end-of-file-fixer
          - id: check-yaml
          - id: check-added-large-files
          - id: check-merge-conflict
          - id: detect-private-key
          - id: check-case-conflict

      - repo: https://github.com/commitizen-tools/commitizen
        rev: v3.2.1
        hooks:
          - id: commitizen
            stages: [commit-msg]

      - repo: https://github.com/alessandrojcm/commitlint-pre-commit-hook
        rev: v9.5.0
        hooks:
          - id: commitlint
            stages: [commit-msg]
            additional_dependencies: ['@commitlint/config-conventional']

      - repo: https://github.com/psf/black
        rev: 23.3.0
        hooks:
          - id: black

      - repo: https://github.com/pycqa/isort
        rev: 5.12.0
        hooks:
          - id: isort
            args: ["--profile", "black"]
    '';
  };

  # Git configuration
  programs.git = {
    enable = true;   
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.excludesfile = "~/.gitignore_global";
      commit.gpgsign = true;
      gpg.program = "${pkgs.gnupg}/bin/gpg2";
    };
  };
}
