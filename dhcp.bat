@echo off
netsh interface ip set address name="利大3" dhcp
netsh interface ip set dnsserver "利大3"  dhcp
rem netsh interface ip set address name="利大3" reset

@echo on

