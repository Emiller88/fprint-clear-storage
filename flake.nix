{
  description = "Python script to fix Framework fingerprint on a NixOS install";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake = {
        # Put your original flake attributes here.
      };
      systems = [
        # systems for which you want to build the `perSystem` attributes
        "x86_64-linux"
        # ...
      ];
      perSystem = {
        config,
        pkgs,
        ...
      }: {
        packages.default = with pkgs;
          python3.pkgs.buildPythonApplication rec {
            pname = "fprint-clear-storage";
            version = "unstable-2023-12-10";
            pyproject = true;

            src = ./.;

            nativeBuildInputs = [
              python3.pkgs.setuptools
              python3.pkgs.wheel
            ];

            propagatedBuildInputs = with python3.pkgs; [
              pygobject3
            ];

            meta = with lib; {
              description = "Python script to fix Framework fingerprint on a NixOS install";
              homepage = "https://github.com/Emiller88/fprint-clear-storage";
              license = licenses.unfree; # FIXME: nix-init did not found a license
              maintainers = with maintainers; [];
              mainProgram = "fprint-clear-storage";
            };
          };
      };
    };
}
