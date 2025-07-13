{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    just
    jq
    direnv
    home-manager
  ];
}
