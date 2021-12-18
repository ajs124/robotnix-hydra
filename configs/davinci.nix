{ robotnix ? <robotnix> }: import robotnix {
  configuration = { pkgs, lib, ... }: lib.mkMerge [
    {
      device = "davinci";
      deviceDisplayName = "Xiaomi 9t";
      flavor = "lineageos";
      androidVersion = 11;

      apps = {
        chromium.enable = false;
        updater.enable = false;
      };

      webview = {
        chromium.enable = false;
        prebuilt.enable = true;
      };
    }
    (import ./common.nix { inherit pkgs lib; })
  ];
}
