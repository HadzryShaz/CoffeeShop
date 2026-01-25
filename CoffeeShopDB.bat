@echo off
set "zipFile=CoffeeShopDB.zip"
set "destination=%AppData%\NetBeans\derby"

echo Looking for %zipFile%...

if exist "%zipFile%" (
    echo Unzipping...
    tar -xf "%zipFile%"
    
    echo Moving to %destination%...
    if not exist "%destination%" mkdir "%destination%"
    xcopy /E /I /Y "CoffeeShopDB" "%destination%\CoffeeShopDB"
    
    echo Done! Your database is ready in NetBeans.
) else (
    echo Error: %zipFile% not found. Make sure this script is in the same folder as the zip.
)
pause