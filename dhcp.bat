@echo off
netsh interface ip set address name="����3" dhcp
netsh interface ip set dnsserver "����3"  dhcp
rem netsh interface ip set address name="����3" reset

@echo on

