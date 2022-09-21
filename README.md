# Spectrum build configs for NXP i.MX8

## Status

Work in progress to adapt device specific out-of-tree build configs for Spectrum OS

## Usage with Spectrum upstream

### Setup repositories

    $ git clone https://spectrum-os.org/git/spectrum
    $ git clone -b rootfs https://spectrum-os.org/git/nixpkgs
    $ git clone https://github.com/tiiuae/spectrum-config-imx8

### Build image - NOTE: does not work yet

    $ export NIX_PATH=$NIX_PATH:spectrum-config=$(pwd)/spectrum-config-imx8/config.nix
    $ cp -r spectrum-config-imx8/imx8qxp spectrum/img/
    $ nix-build spectrum/img/imx8qxp/ -I nixpkgs=nixpkgs-spectrum

### Known issues

fails with:
    ...
    error: attribute 'ubootIMX8QXP' missing

       at /home/vilvo/out-of-tree-build/spectrum/img/imx8qxp/default.nix:6:11:

            5| let
            6|   uboot = pkgs.ubootIMX8QXP;
             |           ^
            7|   spectrum = import ../live { };

remedy: use aarch64-imx8-crosscompile branch from tiiuae/nixpkgs-spectrum

## More info

See https://spectrum-os.org/doc/build-configuration.html
