@echo off
set /p choice=�����뵹��ʱ����:
set /a sec=%choice%*60
echo.�����ػ�������ʱ�룺%sec%
shutdown -s -t %sec%
echo �밴������˳���
@Pause>nul