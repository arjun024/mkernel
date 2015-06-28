# Sample grub.cfg for GRUB and GRUB2.
Thanks to Rubén Laguna for the providing GRUB2 config.

## Install and use mkernel on Ubuntu 14.04
```
sudo vim /etc/grub.d/40_custom
```
* Add the contents of `grub2_config.txt` to the end of the file

```
sudo update-grub && sudo reboot now
```
* Select `myKernel` at the Grub menu screen
