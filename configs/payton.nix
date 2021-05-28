{ robotnix ? <robotnix> }: import robotnix {
  configuration = { pkgs, lib, ... }: lib.mkMerge [
    {
      device = "payton";
      flavor = "lineageos";

      apps = {
        # auditor = {
        #   enable = true;
        #   domain = "attestation.rbtnx.ipv2.de";
        # };

        # chromium.enable = false;
      };

      # webview = {
      #   chromium = {
      #     availableByDefault = false;
      #     enable = false;
      #   };
      #   prebuilt.enable = false;
      # };
    }
    (import ./common.nix { inherit pkgs lib; })
  ];
}
