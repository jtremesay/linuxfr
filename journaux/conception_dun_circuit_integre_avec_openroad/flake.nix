{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    openroad = {
      type = "git";
      url = "https://github.com/The-OpenROAD-Project/OpenROAD";
      submodules = true;
    };
    yosys = {
      type = "git";
      url = "https://github.com/The-OpenROAD-Project/yosys";
      submodules = true;
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      openroad,
      yosys,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            openroad.packages.${system}.default
            yosys.packages.${system}.default
          ];
          packages = with pkgs; [
            fish
            nil
            nixd
            nixfmt-rfc-style
            time
            klayout
            verilator
            perl
            python3
            python3Packages.pandas
            python3Packages.numpy
            python3Packages.firebase-admin
            python3Packages.click
            python3Packages.pyyaml
            python3Packages.yamlfix
          ];
          shellHook = ''
            exec ${pkgs.fish}/bin/fish
          '';
        };
      }
    );
}
