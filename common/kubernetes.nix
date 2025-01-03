{ pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    # Kubernetes
    kubectl
    kubeconform  # Fast Kubernetes manifest validation
    kube-linter  # Best practices checker for Kubernetes YAML
    datree       # Policy enforcement and best practices
    pluto        # Deprecated apiVersion checker
    trivy        # Container and Kubernetes security scanner
    popeye       # Kubernetes cluster resource sanitizer
    kubectx
    kubernetes-helm
    k9s
    kind
    argocd
    kubeseal
    lens
    istioctl
    kubescape
    kube-bench
    cert-manager-cli
    velero
    crossplane-cli
    kratix
    skaffold
    cloudnative-pg
    kubeshark
    kubevpn

    # Container Tools
    docker
    docker-compose
    skopeo
    buildah
    podman
    buildx
    qemu    # Multi-arch support
    k3s     # Lightweight Kubernetes
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
