{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Network Tools
    wireshark
    nmap
    tcpdump
    mtr
    iperf3
  ];
}
