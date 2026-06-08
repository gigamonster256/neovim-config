{
  description = "Neovim config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nvf.url = "github:NotAShelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
    nvf.inputs.flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nixpkgs,
      nvf,
      ...
    }@inputs:
    let
      inherit (nixpkgs) lib;
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forEachSystem = f: lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
      nvimPkg = pkgs: (nvf.lib.neovimConfiguration { inherit pkgs; modules = [ (import ./config) ]; }).neovim;
    in
    {
      formatter = forEachSystem (pkgs: pkgs.nixfmt-tree);
      packages = forEachSystem (pkgs: rec {
        default = neovim;
        neovim = nvimPkg pkgs;
      });
      overlays.default = final: prev: {
        neovim = nvimPkg final;
      };
    };
}
