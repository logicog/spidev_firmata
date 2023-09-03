# A Linux kernel spidev module whitelisting the spi-firmata driver

As explained on https://www.kernel.org/doc/html/latest/spi/spidev.html in
order to bind spidev to an spi device driver, that driver needs to be
whitelisted in the spidev_spi_ids[] table of spidev.c. As long as the
firmata_mod module is not available in the kernel itself, this cannot be
done. So here is a version of spidev.c for kernel 6.1 that does that.

Build and install with
```
make
sudo make modules_install
```
Then modprobe the spidev module and the firmata_mod module and you can bind
spidev to an spi-device on the spi-firmata bus.



