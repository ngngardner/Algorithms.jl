{
  description = "Introduction to algorithms";
  inputs = {
    devshell-flake = { url = "github:numtide/devshell"; };
    nixpkgs = { url = "nixpkgs/release-21.05"; };
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
  };
  outputs = { self, nixpkgs, flake-utils, devshell-flake, flake-compat }:
    (flake-utils.lib.eachSystem [ "x86_64-linux" ]
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              devshell-flake.overlay
            ];
            config = { };
          };
        in
        {
          devShell = with pkgs;
            let
              python-env = pkgs.python39.buildEnv.override
                {
                  extraLibs = with pkgs.python39Packages; [
                    # extra python packages here
                  ];
                  ignoreCollisions = true;
                };
            in
            with pkgs; devshell.mkShell
              {
                packages = [
                  python-env
                  julia_16-bin
                ];

                commands = [{
                  name = "pluto";
                  category = "Julia";
                  command = ''
                    eval $(echo "julia -e 'import Pkg; Pkg.activate(\".\"); using Pluto; Pluto.run()'")
                  '';
                  help = "launch pluto server";
                }];

                env = [
                  {
                    name = "PYTHON";
                    value = "${python-env}/bin/python";
                  }
                  {
                    name = "PYTHONPATH";
                    value = "${python-env}/${pkgs.python3.sitePackages}";
                  }
                  {
                    name = "JULIA_DEPOT_PATH";
                    value = "./.julia_depot";
                  }
                  {
                    name = "JULIA_PROJECT";
                    value = ".";
                  }
                ];
              };
        }
      )
    );
}
