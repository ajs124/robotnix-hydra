{ robotnix ? <robotnix> }: import robotnix {
  configuration = { pkgs, lib, ... }: lib.mkMerge [
    {
      device = "davinci";
      deviceDisplayName = "Xiaomi 9t";
      flavor = "lineageos";
      androidVersion = 10;

      apps = {
        updater.enable = false;
        seedvault.enable = false;
        chromium.enable = false;
      };
      webview.chromium.enable = false;
    }
    (import ./common.nix { inherit pkgs lib; })
  ];
}
