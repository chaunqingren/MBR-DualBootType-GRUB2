@echo off
color 0A
echo ע�����ű����ڱ���USBϵͳ�����̵�����ļ�����ֹ����ɾ��
echo By ���� at 2019.8.26

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
attrib +s %batpath%\EFI
attrib +s +h %batpath%\EFI\desktop.ini
echo EFI�ļ�������������Ϊ��ϵͳ��
attrib +s %batpath%\iso
attrib +s +h %batpath%\sources\desktop.ini
echo iso�ļ�������������Ϊ��ϵͳ��
attrib +s %batpath%\tool
attrib +s +h %batpath%\tool\desktop.ini
echo tool�ļ�������������Ϊ��ϵͳ��
attrib +s +h %batpath%\grldr
echo grldr�ļ�����������Ϊ��ϵͳ+���ء�

pause
