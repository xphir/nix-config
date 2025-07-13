{
  description = "Public nix-darwin and home-manager configuration";

  # Flake-level nix configuration for faster builds
  # nixConfig = {
  #   extra-substituters = [
  #     "https://cache.nixos.org"
  #     "https://nix-community.cachix.org"
  #     "https://numtide.cachix.org"
  #     "https://devenv.cachix.org"
  #   ];

  #   extra-trusted-public-keys = [
  #     "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  #     "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  #     "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
  #     "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
  #   ];

  #   http-connections = 128;
  #   max-substitution-jobs = 128;
  # };

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # theme
    catppuccin.url = "github:catppuccin/nix";
    catppuccin-vsc = {
      url = "https://flakehub.com/f/catppuccin/vscode/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # terminal
    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nix-darwin,
    nixpkgs,
    home-manager,
    ghostty,
    ...
  }: let
    inherit (inputs.nixpkgs) lib;
    mylib = import ./lib {inherit lib;};
    myvars = import ./vars;

    specialArgs =
      inputs
      // {
        inherit myvars mylib;
      };

    darwinSystems = {
      aarch64 = "aarch64-darwin";
    };
    linuxSystems = {
      # x86_64 = "x86_64-linux";
      # aarch64 = "aarch64-linux";
    };

    allSystems = builtins.attrValues darwinSystems ++ builtins.attrValues linuxSystems;
    forAllSystems = func: (nixpkgs.lib.genAttrs allSystems func);
  in {
    # Export modules for use in other flakes
    darwinModules = {
      default = ./modules/darwin;
    };

    homeModules = {
      darwin = ./home/darwin;
      # linux = ./home/linux;
    };

    # Export lib and vars for reuse
    lib = mylib;
    vars = myvars;

    # Example configurations (can be used directly or as templates)
    darwinConfigurations = {
      fern = nix-darwin.lib.darwinSystem {
        inherit specialArgs;
        system = darwinSystems.aarch64;
        modules = [
          ./modules/darwin
          ./hosts/fern
        ];
      };
    };

    homeConfigurations = {
      "${myvars.username}@fern" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${darwinSystems.aarch64};
        extraSpecialArgs = specialArgs // {inherit inputs;};
        modules = [
          ./home/darwin
          ./hosts/fern/home.nix
        ];
      };
    };

    # standalone neovim package for each system
    packages =
      forAllSystems (system: {
      });

    # Format the nix code in this flake
    formatter = forAllSystems (
      system: nixpkgs.legacyPackages.${system}.alejandra
    );
  };
}
