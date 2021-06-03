{ robotnix ? <robotnix> }: import robotnix {
  configuration = { pkgs, lib, ... }: lib.mkMerge [
    {
      device = "sunfish";
      flavor = "grapheneos";

      apps = {
        auditor = {
          enable = false;
          domain = "attestation.rbtnx.ipv2.de";
        };
      };
    }
    (import ./common.nix { inherit pkgs lib; })
  ];
}
