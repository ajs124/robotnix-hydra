{ robotnix ? <robotnix> }: import robotnix {
  configuration = { pkgs, lib, ... }: lib.mkMerge [
    {
      device = "davinci";
      deviceDisplayName = "Xiaomi 9t";
      flavor = "lineageos";
      variant = "userdebug";

      apps = {
        bromite.enable = true;
        updater.enable = false;
      };

      webview = {
        bromite = {
          enable = true;
          availableByDefault = true;
        };
      };
    }
    (import ./common.nix { inherit pkgs lib; })
  ];
}
