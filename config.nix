{
  pkgs = import <nixpkgs> {
    overlays = [
      (self: super:
        {
          linux_latest = super.linuxKernel.kernels.linux_imx8.override {
            structuredExtraConfig = with self.lib.kernel; {
              ATA_PIIX = yes;
              EFI_STUB = yes;
              EFI = yes;
              VIRTIO = yes;
              VIRTIO_PCI = yes;
              VIRTIO_BLK = yes;
              EXT4_FS = yes;
            };
          };
          makeModulesClosure = args: super.makeModulesClosure (args // {
            rootModules = [ "dm-verity" "loop" ];
          });
        })
    ];
  };
}
