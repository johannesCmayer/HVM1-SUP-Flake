{
  description = "HVM1 with DUP/SUP labels";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hvm1-sup-git = {
      url = "github:HigherOrderCO/HVM1/dup_labels";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, rust-overlay, hvm1-sup-git }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      packages = forEachSupportedSystem ({ pkgs }: rec {
        default = hvm1-sup;
        hvm1-sup = pkgs.rustPlatform.buildRustPackage rec {
          pname = "hvm1-sup";
          version = "1.0.16";

          src = hvm1-sup-git;
          cargoHash = "sha256-W7tniTFmzFS3AdEdQyqBDoV1w6PzdIu4iv66PGaQUHQ=";
          doCheck = true;

          cargoPatches = [
            # a patch file to add/update Cargo.lock in the source code
            ./add-Cargo.lock.patch
          ];

          RUSTC_BOOTSTRAP = true;
          meta = with pkgs.lib; {
            description = "A massively parallel, optimal functional runtime in Rust";
            mainProgram = "hvm1";
            homepage = "https://github.com/higherorderco/hvm1";
          };
        };
      });
    };
}
