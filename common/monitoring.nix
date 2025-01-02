{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Monitoring & Observability
    promtool
    grafana-loki
    vector
    logcli
    promql-cli

    # System Monitoring
    htop
    atop
    iotop
  ];
}
