{
  pkgs = import <nixpkgs> {
    overlays = [
      (self: super:
        {
          kernel = super.linux_imx8.override {};
        })
    ];
    crossSystem = { config = "aarch64-unknown-linux-musl"; };
  };
}
