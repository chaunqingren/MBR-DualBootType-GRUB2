@echo off
color 0A
echo ע�����ű����ڱ���USBϵͳ�����̵�����ļ�����ֹ����ɾ��
echo By gzu-liyujiang at ��������ˮ鿴��� on 2019.8.26

echo.
echo ��ǰ�̷�Ϊ��%~d0    ��ǰ�ű�·��Ϊ��%~dp0 
echo.
set disk=%~d0
set batpath=%~dp0
set batpath=%batpath:~0,-1%

@rem �ļ������Ա�����ϵͳ��+s���ģ�desktop.ini����ΪANSI��ͨ��������Ϊ���أ�+h��
cd /d %disk%
attrib +s %batpath%\boot
attrib +s +h %batpath%\boot\desktop.ini
echo boot�ļ�������������Ϊ��ϵͳ��
attrib +s %batpath%\efi
attrib +s +h %batpath%\efi\desktop.ini
echo efi�ļ�������������Ϊ��ϵͳ��
attrib +s %batpath%\sources
attrib +s +h %batpath%\sources\desktop.ini
echo sources�ļ�������������Ϊ��ϵͳ��
attrib +s %batpath%\tool
attrib +s +h %batpath%\tool\desktop.ini
echo tool�ļ�������������Ϊ��ϵͳ��

pause
