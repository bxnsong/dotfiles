{ inputs, ... }: {
  mkDarwin = { hostname, username ? "ben", system ? "aarch64-darwin", }:
    let
      inherit (inputs.nixpkgs) lib;

      customConfPath = ./../hosts/${hostname};
      customConf = if builtins.pathExists (customConfPath) then
        (customConfPath + "/default.nix")
      else
        null;

      customUserPath = ./../home/${hostname}.nix;
    in inputs.nix-darwin.lib.darwinSystem {
      specialArgs = { inherit system inputs username; };
      modules = [
        ../hosts/common/darwin.nix
        customConf
        inputs.home-manager.darwinModules.home-manager
        {
          networking.hostName = hostname;
          networking.computerName = hostname;
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.${username} = {
            imports = [ ./../home ]
              ++ lib.optionals (builtins.pathExists (customUserPath))
              [ customUserPath ];
          };
        }
        inputs.nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            autoMigrate = true;
            user = "${username}";
            taps = with inputs; {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "homebrew/homebrew-bundle" = homebrew-bundle;
              "nikitabobko/homebrew-tap" = aerospace-tap;
              "FelixKratz/homebrew-formulae" = sketchybar-tap;
            };
            mutableTaps = false;
          };
        }

      ];
    };
}
