{ pkgs ? import <nixpkgs> {} }: {
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
    example = pkgs.writeScript "run-me" ''
      #!${pkgs.runtimeShell}
      ${pkgs.jq}/bin/jq . "$HYDRA_JSON"
    '';
  };
}
