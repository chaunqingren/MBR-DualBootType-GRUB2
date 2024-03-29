@echo off

mode con cols=130 lines=50
color 0a

echo *******************************
echo        Image Maker
echo *******************************
echo Created Date: 2019/8/27 10:07
echo Last Modified: 2019/8/27 14:27
echo Author: liyujiang
echo Email: 1032694760@qq.com
echo *******************************

set CURRENT_DISK=%~d0
set CURRENT_DIR=%~dp0
echo 当前工作目录：%cd%
echo 当前盘符：%CURRENT_DISK%
echo 当前盘符和路径全的全文件名格式：%CURRENT_DIR%
echo 当前盘符和路径的短文件名格式：%~sdp0
echo 当前批处理全路径：%~f0
echo.

@rem 启动盘须是MBR分区表，Legacy模式不支持GPT，UEFI模式只支持从FAT32文件系统启动
grub-mkimage.exe --prefix /boot/grub --config early.cfg --directory i386-pc --format i386-pc --output core.img biosdisk part_msdos fat ntfs search_fs_file
copy i386-pc\boot.img boot.img
copy /b boot.img+core.img grub.mbr
del /f boot.img core.img
echo grub.mbr has maked (for Legacy BIOS)
pause

grub-mkimage.exe --prefix /boot/grub --config early.cfg --directory i386-efi --format i386-efi --output grubia32.efi part_gpt part_msdos disk fat exfat ext2 ntfs xfs appleldr hfs iso9660 normal search_fs_file configfile linux linux16 chain loopback echo efi_gop efi_uga video_bochs video_cirrus file gfxmenu gfxterm gfxterm_background gfxterm_menu halt reboot help jpeg ls png true
echo gruba32.efi has maked (for EFI-ia32)
pause

grub-mkimage.exe --prefix /boot/grub --config early.cfg --directory x86_64-efi --format x86_64-efi --output grubx64.efi part_gpt part_msdos disk fat exfat ext2 ntfs xfs appleldr hfs iso9660 normal search_fs_file configfile linux linux16 chain loopback echo efi_gop efi_uga video_bochs video_cirrus file gfxmenu gfxterm gfxterm_background gfxterm_menu halt reboot help jpeg ls png true
echo grubx64.efi has maked (for EFI-x64)
pause

@rem copy grubia32.efi %CURRENT_DISK%\efi\boot\bootia32.efi
@rem copy C:\efi\microsoft\bootia32\bootmgfw.efi %CURRENT_DISK%\efi\microsoft\bootia32\bootmgfw.efi
@rem copy grubx64.efi %CURRENT_DISK%\efi\boot\bootx64.efi
@rem copy C:\efi\microsoft\boot\bootmgfw.efi %CURRENT_DISK%\efi\microsoft\boot\bootmgfw.efi
@rem del /f grubia32.efi grubx64.efi
pause

