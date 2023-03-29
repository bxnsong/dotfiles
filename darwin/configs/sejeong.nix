{
  system = "x86_64-darwin";
  modules = [
    ../modules/standard.nix
    {
      config.ben = {
        user = {
          username = "bensoh";
          homeDirectory = "/Users/bensoh";
        };
      };
    }
  ];
}
