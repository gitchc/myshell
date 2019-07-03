@echo off
mode con lines=30 cols=60
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
:main
cls
color 2f
echo.----------------------------------------------------------- 
echo.
echo.如有360、电脑管家等安全软件提醒，请勾选信任允许和不再提醒！
echo.
color 2e
echo.---------注意事项--------------------------------------------------
echo.
echo.###请务必在oracle所在服务器执行：
echo.###导入文件需要和脚本放在同目录：
echo.
echo.---------菜单选项--------------------------------------------------
echo.
color 2f
echo. 1.imp导入文件
echo. 2.exp导出文件
echo. 3.impdp导入文件
echo. 4.expdp导出文件
echo.-----------------------------------------------------------


set /p choice=请输入数字并按回车键确认:

echo.
if %choice%==1 goto importdmp
if %choice%==2 goto exportdmp
if %choice%==3 goto importdmpplus
if %choice%==4 goto exportdmpplus
cls
"set choice="
echo 您输入有误，请重新选择。
goto main


:importdmp
cls
color 2f
set /p user=输入用户：
set /p pwd= 输入密码：
set /p ssid=输入sid：：
set /p file=dmp文件名：
set /p fuser=FromUser：
set /p tuser=ToUser：
echo.-----------------------------------------------------------
echo.
echo.
echo %user%/%pwd%^@%ssid% file^=%file%.dmp fromuser^=%fuser% touser^=%tuser% 
Imp %user%/%pwd%^@%ssid% file^=%file%.dmp fromuser^=%fuser% touser^=%tuser% 
goto end

:exportdmp
cls
color 2f
set /p user=输入用户：
set /p pwd= 输入密码：
set /p ssid=输入sid：
 echo  %user%/%pwd%^@%ssid% file=%user%.dmp full=y 
exp %user%/%pwd%^@%ssid% file=%user%.dmp full=y 
echo 导出成功!
echo.
goto end


:importdmpplus
cls
color 2f
set /p user=输入用户：
set /p pwd= 输入密码：
set /p ssid=输入Sid:
set /p dic=输入数据目录:
set /p file=dmp文件名：
set /p orgs=原始Sid:
set /p orgt=原始SCHEMA:
echo.-----------------------------------------------------------
echo.
echo.
echo %user%/%pwd%^@%ssid% directory=%dic% dumpfile=%file%.dmp REMAP_SCHEMA=%orgs%:%user% REMAP_TABLESPACE=%orgt%:%ssid%
impdp %user%/%pwd%^@%ssid% directory=%dic% dumpfile=%file%.dmp REMAP_SCHEMA=%orgs%:%user% REMAP_TABLESPACE=%orgt%:%ssid%
goto end

:exportdmpplus
cls
color 2f
set /p user=输入用户：
set /p pwd= 输入密码：
set /p ssid=输入sid：
set /p dict=输入数据目录：
echo  %user%/%pwd%^@%ssid%  directory=%dict% dumpfile=%user%.dmp logfile=%user%.log
expdp %user%/%pwd%^@%ssid%  directory=%dict% dumpfile=%user%.dmp logfile=%user%.log
echo 导出成功!
echo.
goto end

:end
echo 请按任意键退出。
@Pause>nul