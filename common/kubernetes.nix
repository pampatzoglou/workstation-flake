{ pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    # Core Kubernetes Tools
    kubectl
    kubectx      # Manage multiple clusters/namespaces
    kubernetes-helm  # Package manager for Kubernetes
    k9s          # Terminal UI for Kubernetes
    kind         # Local Kubernetes clusters
    krew         # Plugin manager for kubectl

    # Container Runtime & Tools
    docker
    docker-compose
    skopeo       # Container image management
    buildah      # Container image builder
    podman       # Alternative container runtime
    buildx       # Multi-arch build support
    qemu         # Multi-arch support
    k3s          # Lightweight Kubernetes

    # Security & Compliance Tools
    kubescape    # Security risk analysis
    kube-bench   # CIS benchmark testing
    trivy        # Security scanner
    kubeseal     # Sealed Secrets management
    kyverno      # Policy management
    starboard    # Security toolkit

    # Development & Debugging Tools
    skaffold     # Local Kubernetes development
    stern        # Multi-pod log tailing
    kubectl-debug  # Debug running pods
    kubectl-trace  # syscall tracing
    kubectl-capture  # Network traffic capture
    kubeshark    # API traffic viewer
    kubevpn      # VPN for cluster access

    # Validation & Best Practices
    kubeconform  # Fast manifest validation
    kube-linter  # Best practices checker
    datree       # Policy enforcement
    pluto        # Deprecated API checker
    popeye       # Resource sanitizer

    # Observability & Troubleshooting
    kubectl-istio-logs  # Istio service logs
    kubectl-mtail      # Log exporter
    kubectl-images     # Container image info
    kubectl-janitor    # Cluster cleanup
    ktop              # Top for Kubernetes

    # RBAC & Security Analysis
    kubectl-who-can    # Permission checking
    kubectl-access-matrix  # Access control viewer
    kubectl-np-viewer  # Network policy viewer
    kubectl-rolesum   # RBAC overview
    kubectl-rbac-tool # RBAC management
    kubectl-whoami    # Current user context
    kubectl-blame     # Resource change tracking

    # Platform & Service Operators
    argocd           # GitOps deployment
    cert-manager     # Certificate management
    cilium-cli       # CNI management
    cloudnative-pg   # PostgreSQL operator
    crossplane-cli   # Infrastructure provisioning
    kratix           # Platform composition
    velero           # Backup and restore
    istioctl         # Service mesh control

    # Additional Tools
    kubectl-advise-policy  # Policy recommendations
    kubectl-login         # Authentication helper
    kubectl-kubesec-scan  # Security scanning
    kubectl-score        # Manifest scoring
    kubectl-tap          # Pod traffic tap
    lens                 # Kubernetes IDE

  ];

  # Enable docker without sudo
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
  users.extraGroups.docker.members = [ "$USER" ];

  # Enable QEMU for multi-arch support
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.ovmf.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;

  # Enable and configure Teleport for Kubernetes access (NixOS only)
  services.teleport = lib.mkIf (pkgs.stdenv.isLinux) {
    enable = true;
    roles = ["kube"];  # Enable Kubernetes access role
    settings = {
      teleport = {
        data_dir = "/var/lib/teleport";
        auth_token = ""; # Token to be configured
        auth_servers = [""]; # Auth server to be configured
      };
    };
  };
}
