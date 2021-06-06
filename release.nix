{
  sunfish-grapheneOS = {
    inherit (import ./configs/sunfish-grapheneos.nix {}) releaseScript;
  };

  payton = {
    inherit (import ./configs/payton.nix {}) releaseScript;
  };
}
