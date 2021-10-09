{ projectName, ... }: let
  defaultJobset = {
    enabled = 1;
    type = 0;
    nixexprinput = "robotnix-hydra";
    nixexprpath = "release.nix";
    hidden = false;
    description = "";
    checkinterval = 3600;
    schedulingshares = 10;
    enableemail = false;
    emailoverride = "";
    keepnr = 2;
    inputs = {};
  };

  mkInput = { type, value, emailresponsible ? false }: { inherit type value emailresponsible; };

  jobsets = {
    devices = {
      inputs = {
        robotnix-hydra = mkInput { type = "git"; value = "https://github.com/ajs124/robotnix-hydra main"; };
        robotnix = mkInput { type = "git"; value = "https://github.com/danielfullmer/robotnix"; };
      };
    };
  };
in {
  jobsets = derivation {
    name = "robotnix-spec.json";
    system = builtins.currentSystem;

    builder = "/bin/sh";
    args = [
      (builtins.toFile "spec-builder.sh" ''
        echo '${builtins.toJSON (builtins.mapAttrs (_: v: defaultJobset // v) jobsets)}' > "$out"
      '')
    ];
  };
}
