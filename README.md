# Spectrum build configs for NXP i.MX8

## Status

Work in progress to adapt device specific out-of-tree build configs for Spectrum OS
Basic structure for out-of-tree build configuration, referring to Spectrum in place.

Works only on native aarch64-compilation. Does not cross-compile.

## Usage with Spectrum upstream

### Setup repositories

    git clone -b wayland https://github.com/tiiuae/spectrum.git
    git clone -b wayland https://github.com/tiiuae/nixpkgs-spectrum.git
    git clone https://github.com/tiiuae/spectrum-config-imx8

### Build image

    nix-build spectrum-config-imx8/imx8qxp/ -I nixpkgs=nixpkgs-spectrum/ -I spectrum-config=spectrum-config-imx8/config.nix


### Baseline

Upstream `wayland`-branches - https://spectrum-os.org/lists/archives/spectrum-devel/20221025123517.7xzj5yijcwcmdnfx@x220/T/#u
with
    git cherry-pick 7235b5de7f04536dca2154c8c3fcccbbf5a0a78b^..c647cc967312b851fc42b4f16c17f0f05d96985a
    from https://github.com/tiiuae/nixpkgs-spectrum.git
    and
    git cherry-pick 29c30e3c536de7d9249f4c367a917b130f12c60c^...3118261502345f57b923c57e0097024bfc097554
    from https://github.com/tiiuae/spectrum.git
for imx8

### Known issues

Running appvm-hello-wayland crashes cloud-hypervisor

## More info

See https://spectrum-os.org/doc/build-configuration.html
