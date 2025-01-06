{
  description = "Neovim config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    systems,
    flake-parts,
    nvf,
    git-hooks,
    ...
  }: let
    buildPkg = pkgs: modules: (nvf.lib.neovimConfiguration {inherit pkgs modules;}).neovim;
    nvimConfig = import ./config.nix;
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import systems;

      imports = [
        git-hooks.flakeModule
      ];

      perSystem = {
        config,
        pkgs,
        lib,
        ...
      }: let
        neovim = buildPkg pkgs [nvimConfig];
        neovim-app = lib.meta.getExe neovim;
      in {
        formatter = pkgs.alejandra;

        pre-commit.settings.hooks.alejandra.enable = true;
        devShells.default = config.pre-commit.devShell;

        packages = {
          inherit neovim;
          default = neovim;
        };

        apps = {
          neovim.program = neovim-app;
          default.program = neovim-app;
        };
      };

      flake.overlays.default = _final: prev: {
        neovim = buildPkg prev [nvimConfig];
      };
    };
}
