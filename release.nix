{
  sunfish-grapheneOS = {
    inherit (import ./configs/sunfish-grapheneos.nix {}) releaseScript otaDir;
  };

  payton = {
    inherit (import ./configs/payton.nix {}) releaseScript otaDir;
  };
}
