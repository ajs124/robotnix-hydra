{ pkgs ? import <nixpkgs> {} }: rec {
  sunfish-grapheneOS = {
    inherit (import ./configs/sunfish-grapheneos.nix {}) releaseScript;
  };

  payton = {
    inherit (import ./configs/payton.nix {}) releaseScript;
  };

  davinci = {
    inherit (import ./configs/davinci.nix {}) releaseScript;
  };

  runCommandHook = {
    sign-and-serve = pkgs.runCommand "sign-and-serve" {
      extra_path = pkgs.lib.makeBinPath (with pkgs; [
        coreutils
        gawk
        gnupg
        gnutar
        rsync
      ]);
      robotnix_keystore_encrypted = pkgs.fetchurl {
        url = "https://nc.helsinki.tools/s/b9FXZqNSYMyZXbw/download/robotnix-keys.tar.gpg";
        sha256 = "1sypdzqil7nh9xkk18285n82ka9m4zv31wzhq3w7a52vkvja7hyl";
      };
      release_scripts = pkgs.lib.concatMapStringsSep " " (x: x.releaseScript) [
        sunfish-grapheneOS
        payton
        davinci
      ];
    } ''
      substituteAll ${./sign-and-serve.sh} $out
      chmod +x $out
      patchShebangs $out
    '';
  };
}
