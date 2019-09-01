##############################
MBR-DualBootType-GRUB
By gzu-liyujiang on 2019.8.27
Last Modified on 2019.9.1
##############################
利用GRUB实现同时支持Legacy及EFI启动类型的移动盘。
已内置了一个极致精简版的Windows7PE系统可供应急。

1、将已制作的懒人包MBR-DualBootType-GRUB.zip解压到MBR-DualBootType-GRUB。
2、准备优盘、移动硬盘、带卡的读卡器等USB设备，确保磁盘是MBR分区表有且只有一个FAT32分区（Legacy不支持GUID分区表，EFI系统分区只能是FAT32）。若有多个分区或者非FAT32分区，则通过DiskGenius将磁盘转换为MBR格式并格式化为FAT32，下面假设该分区分配盘符为“X”。
3、将MBR-DualBootType-GRUB下的所有文件（boot、efi、iso是必须的）复制到X盘的根目录下。
4、通过BOOTICE，将主引导记录boot/grub/grub.mbr恢复到X盘，安装BOOTMGR分区引导程序并激活分区。
5、打开QemuBootTester开始测试X盘在Legacy、EFI-x64及EFI-ia32三种模式下是否可以正常启动。
6、GRUB2的启动菜单在boot/grub/grub.cfg中配置。
