{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Infrastructure as Code
    terraform
    terraform-docs
    terraform-landscape
    pulumi
    pulumi-bin

    # Cloud Platforms
    awscli2
    azure-cli
    google-cloud-sdk

    # Security Tools
    vault
    trivy
    snyk
    grype
  ];
}
