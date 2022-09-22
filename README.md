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

error: attribute 'rootfs' missing

       at /home/vilvo/out-of-tree-build/spectrum-config-imx8/imx8qxp/default.nix:9:12:

            8|   spectrum = import ../../spectrum/img/live { };
            9|   kernel = spectrum.rootfs.kernel;
             |            ^
           10| in
(use '--show-trace' to show detailed location information)

## More info

See https://spectrum-os.org/doc/build-configuration.html
