@echo off
netsh interface ip set address name="ÒÔÌ«Íø" source=static 192.168.2.191 255.255.252.0 192.168.2.254
netsh interface ip set  dnsservers  "ÒÔÌ«Íø"   static 202.106.0.20 primary validate=no
netsh interface ip add dnsservers  "ÒÔÌ«Íø"  10.20.100.25
@echo on

