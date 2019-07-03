:RESTART
tasklist | find /C "WeChat.exe" > temp.txt
set /p num= < temp.txt
del /F temp.txt
echo %num%
if "%num%" == "0"   start /D "C:\Program Files (x86)\Tencent\WeChat" WeChat.exe
ping -n 60 -w 1000 0.0.0.1 > nul
::if "%num%" == "0"   call "C:\Program Files (x86)\Tencent\WeChat" WeChat.exe
goto RESTART 