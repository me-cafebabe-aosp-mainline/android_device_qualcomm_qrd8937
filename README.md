# Android device tree for Qualcomm MSM8937 QRD running mainline kernel

Qualcomm MSM8937 QRD SKU1 (PMI8950 PMIC, 1080x1920 command mode
panel), booted with lk2nd.

## Status

| Feature | Works | Notes |
|---------|-------|-------|
| Boot | | Not tested with Android |
| Display | | Kernel side works (panel, backlight) |
| Touch | | Synaptics RMI4, untested |
| Audio | | Needs ADSP firmware |
| Wi-Fi / Bluetooth | | Needs WCNSS firmware |
| Camera | no | |
| Modem | no | |
| Charging | | `qcom-smbchg` and fuel gauge, untested |

## Before flashing the Android build

1. Install lk2nd for `msm8952`. The boot image carries it in front of
   the Android boot image (`mkbootimg.mk`).

## Additional repositories required to build

| Path | Source |
|------|--------|
| kernel/mainline/msm89x7-mainline | https://github.com/msm89x7-mainline/linux (branch: `msm89x7/7.1.3`) plus the `msm8937-qcom-qrd-sku1` device tree and the `panel-qcom-qrd-r69006` driver |
| device/xiaomi/mi89xx-mainline | Shares the kernel config of the MSM89x7 devices |

## Kernel

Apply the patches in
`device/mainline/common/docs/KERNEL_PATCHES.md`.

## Partitions

The layout follows the downstream device tree: the `system`
partition is the super partition, holding the logical `system`,
`system_ext`, `product`, `vendor` and `odm` partitions. `/metadata`
is on `oem`.

## Build

    breakfast qrd8937
    m

## Known issues

- TODO(maintainer): check the partition names and sizes against the
  GPT of a real device.
- Firmware for ADSP, WCNSS, Venus and the GPU zap shader is not
  included.
