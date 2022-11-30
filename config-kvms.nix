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
            kernelPatches = [
              {
                name = "kernel_kvms_5.15.32_imx8";
                patch = ./patches/kernel_kvms_5.15.32_imx8.patch;
              }
            ];
          };

          makeModulesClosure = args: super.makeModulesClosure (args // {
            rootModules = [ "dm-verity" "loop" ];
          });

          ubootIMX8QXP = super.ubootIMX8QXP.overrideAttrs ( { patches ? [],...}: {
            patches = patches ++ [
              ./patches/uboot-kvms-copy-to-internal-memory.patch
            ];
          });

          ubootIMX8QM = super.ubootIMX8QM.overrideAttrs ( { patches ? [],...}: {
            patches = patches ++ [
              ./patches/uboot-kvms-copy-to-internal-memory.patch
            ];
          });

          enableKvms = true;

          kvms = super.kvms_bin;
        })
    ];
    crossSystem = { config = "aarch64-unknown-linux-musl"; };
  };
}
