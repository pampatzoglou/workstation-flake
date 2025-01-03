# Workstation Flake

NixOS/nix-darwin configuration for development workstation setup.

## Tool Categories

### Languages & Development

- Programming Languages
  - Go (cobra-cli)
  - Python (poetry, pip, black, pylint)
  - Node.js (yarn)
  - Rust (rustup)
- Databases
  - PostgreSQL (pgcli)
  - MongoDB (mongosh)
  - ClickHouse
  - TimescaleDB
  - DataGrip
- Messaging
  - Kafka (kafkacat)
  - RabbitMQ (rabbitmqctl)
  - Pulsar (pulsar-admin, pulsar-client, pulsar-perf, pulsar-shell, bookkeeper)

### Infrastructure & Cloud

- IaC
  - Terraform (docs, landscape)
  - Pulumi
  - AWS CDK
  - Ansible
  - Helm (docs, helmfile)
- Cloud Platforms
  - AWS (eksctl, aws-vault, saml2aws)
  - Azure (azure-cli)
  - GCP (google-cloud-sdk)
- Platform Engineering
  - Backstage
  - Crossplane
  - Kratix
  - Skaffold
  - Teller

### Containers & Kubernetes

- Container Tools
  - Docker
  - Podman
  - Buildah
  - Skopeo
- Kubernetes
  - Core: kubectl, helm, k9s, KinD
  - GitOps: ArgoCD
  - Service Mesh: Istio
  - Security: Kubeseal
  - UI: Lens

### Observability

- Metrics & Monitoring
  - promtool
  - promql
  - Sloth (SLO generator)
- Logging
  - LogCLI

### Security

- Static Analysis (SAST)
  - Trivy
  - Veracode
  - SonarQube
  - CheckMarx
- Dynamic Analysis (DAST)
  - Snyk
  - OWASP ZAP
- Policy & Compliance
  - Kyverno
  - OPA
  - Gatekeeper
  - CIS Benchmarks
  - Kubescape
- Secret Management
  - HashiCorp Vault
  - External Secrets
  - Teller
  - SOPS
- Access Control
  - Teleport
  - Keycloak
  - IAM tools
  - SSO integrations

## Repository Structure

- common/: Shared configurations
  - development.nix: Languages, DBs, Dev tools
  - infrastructure.nix: Cloud, IaC tools
  - kubernetes.nix: K8s, Container tools
  - monitoring.nix: Observability stack
  - security.nix: Security, Policy tools
- darwin/: macOS specific configurations
- nixos/: Linux specific configurations
- flake.nix: Main configuration entry point
