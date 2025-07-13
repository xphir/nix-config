{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    just
    jq
    home-manager
  ];
}
