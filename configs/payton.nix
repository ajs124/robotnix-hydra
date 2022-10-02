{ robotnix ? <robotnix> }: import robotnix {
  configuration = { pkgs, lib, ... }: lib.mkMerge [
    {
      device = "payton";
      flavor = "lineageos";

      apps = {
        # chromium.enable = false;
        seedvault.enable = false;
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
