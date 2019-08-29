##############################
USB-DualBootType-GRUB
By gzu-liyujiang on 2019.8.27
Last Modified on 2019.8.29
##############################
利用GRUB实现同时支持Legacy及EFI启动类型的移动盘。
已内置了一个极致精简版的Windows7PE系统可供应急。

1、将已制作的懒人包USB-DualBootType-GRUB.zip解压到USB-DualBootType-GRUB。
2、准备优盘、移动硬盘、带卡的读卡器等USB设备，确保磁盘是MBR格式有且只有一个FAT32分区（Legacy不支持GPT格式，EFI系统分区只能是FAT32）。若有多个分区或者非FAT32分区，则通过DiskGenius将磁盘转换为MBR格式并格式化为FAT32，下面假设该分区分配盘符为“X”。
3、将USB-DualBootType-GRUB下的所有文件（boot、efi、iso是必须的）复制到X盘的根目录下。
4、通过BOOTICE，将主引导记录boot/grub/grub.mbr恢复到X盘。
5、打开QemuBootTester开始测试X盘在Legacy、EFI-x64及EFI-ia32三种模式下是否可以正常启动。
6、GRUB2的启动菜单在boot/grub/grub.cfg中配置。

启动过程
1、开机=>Legacy BIOS=>NT5/6 MBR=>/bootmgr=>/boot/BCD=>/windows/system32/boot/winload.exe=>Windows系统。
2、开机=>EFI BIOS=>>NT5/6 MBR=>EFI-ia32=/efi/boot/bootia32.efi(由/efi/microsoft/bootia32/bootmgfw.efi改名得来)=>/efi/microsoft/bootia32/bcd=>/windows/system32/boot/winload.efi=>Windows系统。
3、开机=>EFI BIOS=>NT5/6 MBR=>EFI-x64=>/efi/boot/bootx64.efi(由/efi/microsoft/boot/bootmgfw.efi改名得来)=>/efi/microsoft/boot/bcd=>/windows/system32/boot/winload.efi=>Windows系统。
4、开机=>Legacy&EFI BIOS=>GRUB2 MBR=>EFI-ia32=>/efi/boot/bootia32.efi(由grub-mkimage生成)=>/boot/grub/grub.cfg=>/efi/microsoft/bootia32/bootmgfw.efi=>/efi/microsoft/bootia32/bcd=>/windows/system32/boot/winload.efi=>Windows系统。
5、开机=>Legacy&EFI BIOS=>GRUB2 MBR=>EFI-x64=>/efi/boot/bootx64.efi(由grub-mkimage生成)=>/boot/grub/grub.cfg=>/efi/microsoft/boot/bootmgfw.efi=>/efi/microsoft/boot/bcd=>/windows/system32/boot/winload.efi=>Windows系统。
