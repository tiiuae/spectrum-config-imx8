# Spectrum build configs for NXP i.MX8

## Status

Work in progress to adapt device specific out-of-tree build configs for Spectrum OS
Basic structure for out-of-tree build configuration, referring to Spectrum in place.

## Usage with Spectrum upstream

### Setup repositories

    git clone https://spectrum-os.org/git/spectrum # upstream as is
    git clone -b aarch64-imx8-crosscompile https://github.com/tiiuae/nixpkgs-spectrum.git # for imx8 uboot
    git clone https://github.com/tiiuae/spectrum-config-imx8

### Build image - NOTE: does not work yet

    export NIX_PATH=$NIX_PATH:spectrum-config=$(pwd)/spectrum-config-imx8/config.nix
    nix-build spectrum-config-imx8/imx8qxp/ -I nixpkgs=nixpkgs-spectrum/

### Known issues

```
       > make: *** No rule to make target '/nix/store/06g1qv0p84bbsjyk6f6p4r9l418dcg7k-systemd-aarch64-unknown-linux-musl-250.4/lib/systemd/boot/efi/systemd-bootx64.efi', needed by 'build/boot.fat'.  Stop.
```

## More info

See https://spectrum-os.org/doc/build-configuration.html
