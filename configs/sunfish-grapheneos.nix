{ robotnix ? <robotnix-adevtool> }: import robotnix {
  configuration = { pkgs, lib, ... }: lib.mkMerge [
    {
      device = "sunfish";
      flavor = "grapheneos";

      microg.enable = false;
    }
    (import ./common.nix { inherit pkgs lib; })
  ];
}
