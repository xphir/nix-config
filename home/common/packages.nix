{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    just
    jq
  ];
}
