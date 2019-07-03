@echo off
set /p choice=请输入倒计时分钟:
set /a sec=%choice%*60
echo.即将关机，倒计时秒：%sec%
shutdown -s -t %sec%
echo 请按任意键退出。
@Pause>nul