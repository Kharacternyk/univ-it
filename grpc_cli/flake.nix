{
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            (pkgs.python3.withPackages
              (packages: [
                packages.fire
                packages.grpcio-tools
              ]))
          ];
        };
      }
    );
}
