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
    vault           # Secret management
    vault-cli
    cosign         # Container signing
    
    # SAST Tools
    trivy          # Container and filesystem scanner
    veracode-cli   # Veracode scanning
    sonar-scanner-cli # SonarQube scanner
    checkmarx-cli    # Checkmarx scanner
    
    # DAST Tools
    snyk           # Vulnerability scanner
    zap            # OWASP ZAP
    
    # Policy & Compliance
    kyverno        # Kubernetes policy engine
    kube-bench     # CIS benchmarks for Kubernetes
    kubescape      # Kubernetes security platform
    conftest       # Policy testing
    opa            # Open Policy Agent
    gatekeeper     # Kubernetes policy controller
    
    # Access Control
    aws-iam-authenticator
    azure-cli      # Azure authentication
    gcloud         # GCP authentication
    keycloak       # Identity and access management
    external-secrets # Kubernetes external secrets operator
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
