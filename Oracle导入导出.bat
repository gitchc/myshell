@echo off
mode con lines=30 cols=60
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
:main
cls
color 2f
echo.----------------------------------------------------------- 
echo.
echo.����360�����ԹܼҵȰ�ȫ������ѣ��빴ѡ��������Ͳ������ѣ�
echo.
color 2e
echo.---------ע������--------------------------------------------------
echo.
echo.###�������oracle���ڷ�����ִ�У�
echo.###�����ļ���Ҫ�ͽű�����ͬĿ¼��
echo.
echo.---------�˵�ѡ��--------------------------------------------------
echo.
color 2f
echo. 1.imp�����ļ�
echo. 2.exp�����ļ�
echo. 3.impdp�����ļ�
echo. 4.expdp�����ļ�
echo.-----------------------------------------------------------


set /p choice=���������ֲ����س���ȷ��:

echo.
if %choice%==1 goto importdmp
if %choice%==2 goto exportdmp
if %choice%==3 goto importdmpplus
if %choice%==4 goto exportdmpplus
cls
"set choice="
echo ����������������ѡ��
goto main


:importdmp
cls
color 2f
set /p user=�����û���
set /p pwd= �������룺
set /p ssid=����sid����
set /p file=dmp�ļ�����
set /p fuser=FromUser��
set /p tuser=ToUser��
echo.-----------------------------------------------------------
echo.
echo.
echo %user%/%pwd%^@%ssid% file^=%file%.dmp fromuser^=%fuser% touser^=%tuser% 
Imp %user%/%pwd%^@%ssid% file^=%file%.dmp fromuser^=%fuser% touser^=%tuser% 
goto end

:exportdmp
cls
color 2f
set /p user=�����û���
set /p pwd= �������룺
set /p ssid=����sid��
 echo  %user%/%pwd%^@%ssid% file=%user%.dmp full=y 
exp %user%/%pwd%^@%ssid% file=%user%.dmp full=y 
echo �����ɹ�!
echo.
goto end


:importdmpplus
cls
color 2f
set /p user=�����û���
set /p pwd= �������룺
set /p ssid=����Sid:
set /p dic=��������Ŀ¼:
set /p file=dmp�ļ�����
set /p orgs=ԭʼSid:
set /p orgt=ԭʼSCHEMA:
echo.-----------------------------------------------------------
echo.
echo.
echo %user%/%pwd%^@%ssid% directory=%dic% dumpfile=%file%.dmp REMAP_SCHEMA=%orgs%:%user% REMAP_TABLESPACE=%orgt%:%ssid%
impdp %user%/%pwd%^@%ssid% directory=%dic% dumpfile=%file%.dmp REMAP_SCHEMA=%orgs%:%user% REMAP_TABLESPACE=%orgt%:%ssid%
goto end

:exportdmpplus
cls
color 2f
set /p user=�����û���
set /p pwd= �������룺
set /p ssid=����sid��
set /p dict=��������Ŀ¼��
echo  %user%/%pwd%^@%ssid%  directory=%dict% dumpfile=%user%.dmp logfile=%user%.log
expdp %user%/%pwd%^@%ssid%  directory=%dict% dumpfile=%user%.dmp logfile=%user%.log
echo �����ɹ�!
echo.
goto end

:end
echo �밴������˳���
@Pause>nul