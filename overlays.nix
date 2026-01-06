[
  (self: super: {
    intellij-pinned = let
      pinnedPkgs = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/nixos-25.11.tar.gz";
        sha256 = "13rp7g4ivphc70z6fdb2gf6angzr6qm2vrx32nk286nli991117h";
      }) {
        system = super.stdenv.hostPlatform.system;
        config.allowUnfree = true;
      };

      mjump-zip = super.fetchurl {
        name = "mjump-2.2.0.zip";
        url = "https://plugins.jetbrains.com/plugin/download?rel=true&updateId=761814";
        sha256 = "sha256-RPsieSRVk1LWkX9rjv/87/6Xy7jvremZEUVeGfuoxMo=";
      };

      mjump = super.runCommand "mjump" {
        nativeBuildInputs = [ super.unzip ];
      } ''
        unzip ${mjump-zip}
        mkdir -p $out
        mv MJump/* $out/
      '';
    in
      pinnedPkgs.jetbrains.plugins.addPlugins pinnedPkgs.jetbrains.idea [
        "ideavim"
        mjump
      ];
  })
]
