{ robotnix ? <robotnix> }: import robotnix {
  configuration = { pkgs, lib, ... }: lib.mkMerge [
    {
      device = "sunfish";
      flavor = "grapheneos";

      signing.keyStorePath = "/home/andy/robotnix/keys";

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
