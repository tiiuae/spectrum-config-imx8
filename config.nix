{
  pkgs = import <nixpkgs> {
    overlays = [
      (self: super:
        {
          makeModulesClosure = args: super.makeModulesClosure (args // {
            rootModules = [ "dm-verity" "loop" ];
          });
        })
    ];
  };
}
