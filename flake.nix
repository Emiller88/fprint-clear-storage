{
  description = "Just some python scripts to download books.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.11";
    utils.url = "github:numtide/flake-utils";
  };
  outputs = {self}: {
    defaultPackage.x86_64-linux = ./default.nix;
  };
}
