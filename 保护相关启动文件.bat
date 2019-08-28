@echo off
color 0A
echo 注：本脚本用于保护USB系统启动盘的相关文件，防止不慎删除
echo By 李玉江 at 2019.8.26

echo.
echo 当前盘符为：%~d0    当前脚本路径为：%~dp0 
echo.
set disk=%~d0
set batpath=%~dp0
set batpath=%batpath:~0,-1%

@rem 文件夹属性必须是系统（+s）的，desktop.ini编码为ANSI，通常设属性为隐藏（+h）
cd /d %disk%
attrib +s %batpath%\boot
attrib +s +h %batpath%\boot\desktop.ini
echo boot文件夹属性已设置为“系统”
attrib +s %batpath%\EFI
attrib +s +h %batpath%\EFI\desktop.ini
echo EFI文件夹属性已设置为“系统”
attrib +s %batpath%\iso
attrib +s +h %batpath%\sources\desktop.ini
echo iso文件夹属性已设置为“系统”
attrib +s %batpath%\tool
attrib +s +h %batpath%\tool\desktop.ini
echo tool文件夹属性已设置为“系统”
attrib +s +h %batpath%\grldr
echo grldr文件属性已设置为“系统+隐藏”

pause
