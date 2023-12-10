{ lib
, python3
, fetchFromGitHub
}:

python3.pkgs.buildPythonApplication rec {
  pname = "fprint-clear-storage";
  version = "unstable-2023-12-10";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Emiller88";
    repo = "fprint-clear-storage";
    rev = "9d8c6298763db2be598449cd28df67c3bfb51158";
    hash = "sha256-W3r8d2mgUQChcvupn0RUPJczRC/nFlvQRwUulr1E+94=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    pygobject
  ];

  pythonImportsCheck = [ "fprint_clear_storage" ];

  meta = with lib; {
    description = "Python script to fix Framework fingerprint on a NixOS install";
    homepage = "https://github.com/Emiller88/fprint-clear-storage";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ ];
    mainProgram = "fprint-clear-storage";
  };
}
