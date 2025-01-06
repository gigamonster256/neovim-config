{
  description = "Neovim config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nvf.url = "github:NotAShelf/nvf";
    systems.url = "github:nix-systems/default";
    flake-parts.url = "github:hercules-ci/flake-parts";
    git-hooks.url = "github:cachix/git-hooks.nix";
  };
  outputs = inputs @ {
    systems,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import systems;
      imports = [
        inputs.git-hooks.flakeModule
      ];
      perSystem = {
        config,
        pkgs,
        ...
      }: {
        formatter = pkgs.alejandra;

        pre-commit.settings.hooks.alejandra.enable = true;
        devShells.default = config.pre-commit.devShell;
      };
    };
}
