{pkgs, ...}: {
  home.packages = with pkgs; [
    # Misc
    tlrc # Terminal Launcher for macOS
    cowsay # Command-line program that generates ASCII pictures of a cow saying things
    #cmatrix
    yq # YAML processor
    python3
    which # Shows the full path of shell commands
    go # Go programming language
    tree # Directory tree lister
    file # File type detection
    aria2 # Lightweight multi-protocol & multi-source command-line download utility
    zstd # Fast lossless compression algorithm
    httpie # User-friendly HTTP client
    socat # Network relay (replacement for netcat)
    nmap # Network discovery and security auditing
    ripgrep # Line-oriented search tool that recursively searches your current directory for a regex pattern
    gnupg # GNU privacy guard (OpenPGP implementation)
    sheldon # Fast, configurable Zsh plugin manager
    zip # Zip compression
    unzip # Zip extraction
    xz # XZ compression
    zstd # Zstandard compression
    p7zip # 7-Zip compression
    gnutar # GNU tar archiver
    gnused # GNU sed
    gawk # GNU awk
    shfmt # Shell script formatter
    shellcheck # Shell script static analysis tool
  ];

  programs = {
    # a cat(1) clone with syntax highlighting and Git integration.
    bat = {
      enable = true;
    };
  };
}
