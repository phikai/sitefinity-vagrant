@echo off

echo Installing SQL Server 2008 Express, it will take a while...
C:\vagrant\resources\SQLEXPRWT_x64_ENU.exe /Q /Action=install /INDICATEPROGRESS /INSTANCENAME="SQLEXPRESS" /INSTANCEID="SQLExpress" /IAcceptSQLServerLicenseTerms /FEATURES=SQL,Tools /TCPENABLED=1 /SECURITYMODE="SQL" /SAPWD="#SAPassword!"

echo Disabling firewall
netsh advfirewall set allprofiles state off
echo Done!
