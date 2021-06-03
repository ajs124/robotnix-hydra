{ pkgs, lib }: {
  signing = {
    enable = true;
    keyStorePath = "${../keys}";
  };

  hosts = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/StevenBlack/hosts/3.2.11/hosts";
    sha256 = "005kpy368rvyx0drd88kag4wp9jnxjxik2w4c97w7pwgsqi2x8a4";
  };

  microg.enable = lib.mkDefault true;

  apps = {
    updater = lib.mkDefault {
      enable = true;
      url = "https://rbtnx.ipv2.de/";
    };

    seedvault.enable = lib.mkDefault true;
    fdroid.enable = lib.mkDefault true;
  };
}
