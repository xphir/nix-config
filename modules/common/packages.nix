{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    just
    gh
    jq
    direnv
    home-manager
    watchman
  ];
}
