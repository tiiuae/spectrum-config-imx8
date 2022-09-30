# SPDX-FileCopyrightText: 2022 Unikie

{ config ? import ../../spectrum/nix/eval-config.nix {} }:

let
  inherit (config) pkgs;
  uboot = pkgs.ubootIMX8QXP;
  spectrum = import ../../spectrum/img/live { };
  kernel = spectrum.rootfs.kernel;
in

with pkgs;

stdenvNoCC.mkDerivation {
  pname = "spectrum-live-imx8qxp.img";
  version = "0.1";

  unpackPhase = "true";

  nativeBuildInputs = [
    pkgsBuildHost.util-linux
    pkgsBuildHost.jq
    pkgsBuildHost.mtools
  ];

  buildCommand = ''
    install -m 0644 ${spectrum} $pname
    dd if=/dev/zero bs=1M count=6 >> $pname
    partnum=$(sfdisk --json $pname | grep "node" | wc -l)
    while [ $partnum -gt 0 ]; do
      echo '+6M,' | sfdisk --move-data $pname -N $partnum
      partnum=$((partnum-1))
    done
    dd if=${uboot}/flash.bin of=$pname bs=1k seek=32 conv=notrunc
    IMG=$pname
    ESP_OFFSET=$(sfdisk --json $IMG | jq -r '
      # Partition type GUID identifying EFI System Partitions
      def ESP_GUID: "C12A7328-F81F-11D2-BA4B-00A0C93EC93B";
      .partitiontable |
      .sectorsize * (.partitions[] | select(.type == ESP_GUID) | .start)
    ')
    mcopy -no -i $pname@@$ESP_OFFSET ${kernel}/dtbs/freescale/imx8qxp-mek.dtb ::/
    mv $pname $out
  '';
}
