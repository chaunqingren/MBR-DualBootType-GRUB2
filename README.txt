##########################
USB-DualBootType-GRUB
By 李玉江 on 2019.8.27
##########################
利用GRUB实现同时支持Legacy及EFI类型的USB启动盘。
已内置了一个极致精简版的Windows7PE系统可供应急。

1、将已制作的懒人包USB-DualBootType-GRUB.zip解压到USB-DualBootType-GRUB。
2、准备优盘、移动硬盘、带卡的读卡器等USB设备，确保有一个FAT32分区（EFI系统分区只能是FAT32，即常说的ESP）。
 通过BOOTICE查看分区的文件系统格式，若没有FAT32分区，则通过DiskGenius分割出一个300MB的分区来格式化为FAT32。
（某些系统只支持显示可移动盘的一个分区，启动盘制作完成后，建议将该分区设为隐藏，以下称该分区为“X盘”）。
3、将USB-DualBootType-GRUB下的所有文件复制到“X盘”的根目录下。
4、通过BOOTICE的恢复MBR功能，将boot/grub/grub.mbr恢复到“X盘”。
5、打开QemuBootTester开始测试“X盘”在Legacy、EFI-x64及EFI-ia32三种模式下是否可以正常启动。
6、GRUB2的启动菜单在boot/grub/grub.cfg中配置，GRUB4DOS的启动菜单在boot/grub4dos/menu.lst中配置。
