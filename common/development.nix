{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Development Tools
    vscode
    gh  # GitHub CLI

    # Programming Languages & Tools
    go
    python3
    nodejs
    yarn
    rustup
    cobra-cli  # Go CLI framework
    poetry     # Python dependency management
    pip        # Python package installer
    black      # Python formatter
    pylint     # Python linter
    
    # Database Tools
    pgcli
    mycli
    mongosh
    clickhouse-client
    timescaledb-tools
    postgresql_15    # PostgreSQL server and tools
    mongodb-tools    # MongoDB tools
    datagrip        # JetBrains database tool
    
    # API Development
    grpcurl
    postman

    # Messaging Tools
    kafkacat        # Kafka CLI
    rabbitmqctl     # RabbitMQ CLI
    pulsar-client   # Pulsar client CLI
    pulsar-admin    # Pulsar admin CLI
    pulsar-perf     # Pulsar performance testing
    pulsar-shell    # Pulsar interactive shell
    bookkeeper      # BookKeeper CLI

    # Password Management
    keepassxc

  ];
}
