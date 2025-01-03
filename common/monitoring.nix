{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Monitoring & Observability
    promtool
    logcli
    promql-cli
    sloth            # SLO generator

    # System Monitoring
    htop
    atop
    iotop
    netdata         # Real-time performance monitoring
    telegraf        # Metrics collection agent
  ];
}
