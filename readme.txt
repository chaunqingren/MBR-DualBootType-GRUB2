##########################
USB-DualBootType-GRUB2
By 李玉江 on 2019.8.27
##########################
利用GRUB2实现同时支持Legacy及UEFI模式的USB启动盘

一、准备工具
启动引导程序：GNU GRUB（https://ftp.gnu.org/gnu/grub/grub-2.04-for-windows.zip）
引导扇区维护工具：BOOTICE
磁盘分区工具：DiskGenius
启动测试器：QemuBootTester

二、制作懒人包
1、创建文件夹USB-DualBootType-GRUB2，在其下建立目录结构boot/grub、efi/boot。
2、解压grub-2.04-for-windows.zip，复制里面的i386-efi、i386-pc、x86_64-efi、locale、themes、unicode.pf2、grub-mkimage.exe到boot/grub下。将locale/zh_CN/grub.mo剪切到locale/grub.mo并改名为zh_CN.mo，然后删掉locale下的所有文件夹只保留zh_CN.mo。
2、参考模板文件创建early.cfg、grub.cfg。
3、创建批处理脚本make-image.cmd，用于生成GRUB2在Legacy及UEFI启动模式下的引导文件。


三、制作启动盘
1、将已制作的懒人包USB-DualBootType-GRUB2.zip解压到USB-DualBootType-GRUB2。
2、准备优盘、移动硬盘、带卡的读卡器等USB设备，确保有一个FAT32分区（UEFI的启动分区只能是FAT32）。通过BOOTICE查看分区的文件系统格式，若没有FAT32分区，则通过DiskGenius分割出一个至少30MB的分区来格式为FAT32（某些系统只支持显示可移动盘的一个分区，启动盘制作完成后，建议将该分区设为隐藏）。以下称该分区为“X盘”。
3、将USB-DualBootType-GRUB2下的所有文件复制到“X盘”的根目录下。
4、通过BOOTICE恢复MBR将boot/grub/grub.mbr主引导记录恢复到“X盘”的扇区。
5、打开QemuBootTester开始测试“X盘”是否可以正常启动。
