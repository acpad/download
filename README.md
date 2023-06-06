# download

[github.com/acpad/download/](https://github.com/acpad/download/)

## Firmware
Binary firmware images: `com.acpad.$DEVICE.firmware-$VERSION.bin`, automatically picked up by the
web [configure](https://github.com/acpad/configure) interface; or can be uploaded to the device
with [BOSSA](https://github.com/shumatech/BOSSA).

Firmware updates, installed using the [Mass Storage Interface](https://github.com/microsoft/uf2):
`com.versioduo.$DEVICE.firmware-$VERSION.uf2`; a recovery option in case the
bootloader is updated and there is no running firmware, or in case the web [configure](https://github.com/acpad/configure)
interface is unable to update the device.
