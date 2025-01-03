{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Infrastructure as Code
    terraform
    terraform-docs
    terraform-landscape
    pulumi
    pulumi-bin
    cfn-lint # CloudFormation linting
    cfn-flip # CloudFormation YAML/JSON converter
    aws-cdk # AWS CDK for IaC
    cdktf # CDK for Terraform
    ansible
    ansible-lint
    sops # Secrets management
    helm-docs
    helmfile
    helmsman # Helm releases manager

    # Cloud Platforms
    awscli2
    azure-cli
    google-cloud-sdk
    eksctl     # Amazon EKS CLI
    aws-iam-authenticator
    aws-vault  # AWS credentials manager
    saml2aws  # SAML authentication for AWS

    # Platform Engineering
    backstage  # Developer portal
    crossplane # Universal control plane
    kratix     # Platform composition
    teller     # Secrets management
    skaffold   # Local Kubernetes development

    # Security & Linting Tools
    vault
    trivy
    snyk
    grype
    hadolint # Dockerfile linting
    checkov # Security and compliance scanning for IaC
    tfsec # Terraform security scanner
    terrascan # Security vulnerability scanner for IaC
    dockle # Container image linter

    # Cost Analysis & Management
    infracost # Cloud cost estimates
    aws-nuke # AWS account cleanup
    cloud-nuke # Cloud resource cleanup
    komiser # Cloud environment inspector
    
    # Additional IaC Tools
    terragrunt # Terraform wrapper for keeping configurations DRY
    atlantis # Terraform Pull Request Automation
    terraform-compliance # BDD Testing for Terraform
    conftest # Policy testing against structured configuration files

    # CI/CD Tools
    gh-actions-cli # GitHub Actions CLI
    argocd # GitOps continuous delivery
    circleci-cli # CircleCI CLI
    gitlab-runner # GitLab CI runner
  ];
}
