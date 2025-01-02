{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Kubernetes
    kubectl
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
  ];

  # Enable and configure Teleport for Kubernetes access
  services.teleport = {
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
