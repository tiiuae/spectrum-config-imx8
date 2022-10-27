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
    # from https://github.com/tiiuae/nixpkgs-spectrum.git

and

    git cherry-pick 29c30e3c536de7d9249f4c367a917b130f12c60c^...3118261502345f57b923c57e0097024bfc097554
    # from https://github.com/tiiuae/spectrum.git

for imx8

### Known issues

`vm-start appvm-hello-wayland` starts but does not provide guest hello-wayland cat image to host compositor.

Following is seen in the debug console:
```
[  106.228382] Aborting core
[  106.848287] kauditd_printk_skb: 108 callbacks suppressed
[  106.848305] audit: type=1326 audit(114.040:1178): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=1681 comm="_gpu2" exe="/nix/store/8bdgfy0dd4qfnx2bl3qigalcz3fws0dc-cloud-hypervisor-static-aarch64-unknown-linux-musl-26.0/bin/cloud-hypervisor" sig=0 arch=c00000b7 syscall=198 compat=0 ip=0x74b808 code=0x7ffc0000
[  106.881108] audit: type=1326 audit(114.040:1179): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=1681 comm="_gpu2" exe="/nix/store/8bdgfy0dd4qfnx2bl3qigalcz3fws0dc-cloud-hypervisor-static-aarch64-unknown-linux-musl-26.0/bin/cloud-hypervisor" sig=0 arch=c00000b7 syscall=203 compat=0 ip=0x74f208 code=0x7ffc0000
[  106.908526] audit: type=1326 audit(114.040:1180): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=1681 comm="_gpu2" exe="/nix/store/8bdgfy0dd4qfnx2bl3qigalcz3fws0dc-cloud-hypervisor-static-aarch64-unknown-linux-musl-26.0/bin/cloud-hypervisor" sig=0 arch=c00000b7 syscall=101 compat=0 ip=0x74f208 code=0x7ffc0000
[  106.948603] audit: type=1326 audit(114.140:1181): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=1681 comm="_gpu2" exe="/nix/store/8bdgfy0dd4qfnx2bl3qigalcz3fws0dc-cloud-hypervisor-static-aarch64-unknown-linux-musl-26.0/bin/cloud-hypervisor" sig=0 arch=c00000b7 syscall=198 compat=0 ip=0x74b808 code=0x7ffc0000
[  106.976047] audit: type=1326 audit(114.140:1182): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=1681 comm="_gpu2" exe="/nix/store/8bdgfy0dd4qfnx2bl3qigalcz3fws0dc-cloud-hypervisor-static-aarch64-unknown-linux-musl-26.0/bin/cloud-hypervisor" sig=0 arch=c00000b7 syscall=203 compat=0 ip=0x74f208 code=0x7ffc0000
[  107.003463] audit: type=1326 audit(114.140:1183): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=1681 comm="_gpu2" exe="/nix/store/8bdgfy0dd4qfnx2bl3qigalcz3fws0dc-cloud-hypervisor-static-aarch64-unknown-linux-musl-26.0/bin/cloud-hypervisor" sig=0 arch=c00000b7 syscall=101 compat=0 ip=0x74f208 code=0x7ffc0000
[  107.048906] audit: type=1326 audit(114.240:1184): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=1681 comm="_gpu2" exe="/nix/store/8bdgfy0dd4qfnx2bl3qigalcz3fws0dc-cloud-hypervisor-static-aarch64-unknown-linux-musl-26.0/bin/cloud-hypervisor" sig=0 arch=c00000b7 syscall=198 compat=0 ip=0x74b808 code=0x7ffc0000
[  107.076356] audit: type=1326 audit(114.240:1185): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=1681 comm="_gpu2" exe="/nix/store/8bdgfy0dd4qfnx2bl3qigalcz3fws0dc-cloud-hypervisor-static-aarch64-unknown-linux-musl-26.0/bin/cloud-hypervisor" sig=0 arch=c00000b7 syscall=203 compat=0 ip=0x74f208 code=0x7ffc0000
MESA-LOADER: failed to open zink: /run/opengl-driver/lib/dri/zink_dri.so: cannot open shared object file: No such file or directory (search paths /run/opengl-driver/lib/dri, suffix _dri)
failed to load driver: zink
libEGL warning: egl: failed to create dri2 screen
[  107.319415] Process 2580(socat) has RLIMIT_CORE set to 1
[  107.324872] Aborting core
[  107.343467] audit: type=1326 audit(114.532:1186): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=1681 comm="_gpu2" exe="/nix/store/8bdgfy0dd4qfnx2bl3qigalcz3fws0dc-cloud-hypervisor-static-aarch64-unknown-linux-musl-26.0/bin/cloud-hypervisor" sig=0 arch=c00000b7 syscall=198 compat=0 ip=0x74b808 code=0x7ffc0000
[  107.370923] audit: type=1326 audit(114.532:1187): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=1681 comm="_gpu2" exe="/nix/store/8bdgfy0dd4qfnx2bl3qigalcz3fws0dc-cloud-hypervisor-static-aarch64-unknown-linux-musl-26.0/bin/cloud-hypervisor" sig=0 arch=c00000b7 syscall=203 compat=0 ip=0x74f208 code=0x7ffc0000
MESA-LOADER: failed to open zink: /run/opengl-driver/lib/dri/zink_dri.so: cannot open shared object file: No such file or directory (search paths /run/opengl-driver/lib/dri, suffix _dri)
failed to load driver: zink
libEGL warning: egl: failed to create dri2 screen
[  108.316493] Process 2598(socat) has RLIMIT_CORE set to 1
[  108.321882] Aborting core
```

## More info

See https://spectrum-os.org/doc/build-configuration.html
