@echo off
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v profileluncher /t REG_SZ /d D:\a\ProfileLuncher.exe
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v vsetup /t REG_SZ /d D:\a\setup.exe
net user administrator FreeUser1234 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Failed to retreive NGROK authtoken - check again your authtoken"
ping -n 10 127.0.0.1 >nul
