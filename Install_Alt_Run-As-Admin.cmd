@echo off
echo.
echo    If your install.inf is not working, you can use this cmd as its alternative. (Windows)
echo.
echo    Wait, until the Git is installing...
echo.
setlocal

set "git_exe=%ProgramFiles%\Git\bin\git.exe"

if exist "%git_exe%" (
echo.
echo     Git is installed on this PC.
echo.
) else (
    echo Git is not installed on this PC. Installing it now!
	start cmd /c "winget install Git.Git"
)

endlocal
pause

Echo.
Echo.
echo    Downloading the 'Instructions.txt' file... Check your Downloads folder or Desktop.
echo.
echo.
cd "%userprofile%\Desktop"
curl -LJO https://gist.githubusercontent.com/PSGitHubUser1/8244f8a80ccc119c1d50f047a0af2170/raw/22516ac287ae5fc41b58d922f10af87aa6e14ca4/Instructions.txt
%userprofile%\Desktop\Instructions.txt
echo. 
echo.
Echo    FOLLOW INSTRUCTIONS GIVEN IN "Instructions.txt"
Echo.
echo.
cd "%userprofile%\Desktop"
echo.
mkdir W11-CC-V2.2-HDPI-by-Jepri
echo.
curl -LJO  https://github.com/PSGitHubUser1/Windows-11-Cursor-Concept-Pro-v2.x/releases/download/v2.2pro_NEW/W11-CC-V2.2-HDPI-by-Jepri.zip
echo.
powershell -command "Expand-Archive -Path %userprofile%\Desktop\W11-CC-V2.2-HDPI-by-Jepri.zip -DestinationPath %userprofile%\Desktop\W11-CC-V2.2-HDPI-by-Jepri"
echo.
cd "%userprofile%\Desktop"
del W11-CC-V2.2-HDPI-by-Jepri.zip
echo.
cd /d "%WinDir%\Cursors"
echo.
echo.
echo     Please choose a cursor color:  
echo       1. Light color
echo       2. Dark color
echo       3. Exit
echo.
echo.
set /p mode=   Choose a color (only one option to choose, no go back option): 

if %mode%==1 (
    echo.
    cd "%WinDir%\Cursors"
    mkdir Win11_Light_HD_Cursors
    cd "%WinDir%\Cursors\Win11_Light_HD_Cursors"

    XCOPY /I /Y /E "%userprofile%\Desktop\W11-CC-V2.2-HDPI-by-Jepri\light\regular\base" "%WinDir%\Cursors\Win11_Light_HD_Cursors"
    DEL "%userprofile%\Desktop\W11-CC-V2.2-HDPI-by-Jepri\light\regular\01. default\Install.inf"
    XCOPY /I /Y /E "%userprofile%\Desktop\W11-CC-V2.2-HDPI-by-Jepri\light\regular\01. default" "%WinDir%\Cursors\Win11_Light_HD_Cursors"
    echo.
    pause
) else if %mode%==2 (
    echo.
    cd "%WinDir%\Cursors"
    mkdir Win11_Dark_HD_Cursors
	cd "%WinDir%\Cursors\Win11_Dark_HD_Cursors"

    XCOPY /I /Y /E "%userprofile%\Desktop\W11-CC-V2.2-HDPI-by-Jepri\dark\regular\base" "%WinDir%\Cursors\Win11_Dark_HD_Cursors"
    DEL "%userprofile%\Desktop\W11-CC-V2.2-HDPI-by-Jepri\dark\regular\01. default\Install.inf"
    XCOPY /I /Y /E "%userprofile%\Desktop\W11-CC-V2.2-HDPI-by-Jepri\dark\regular\01. default" "%WinDir%\Cursors\Win11_Dark_HD_Cursors"
    echo.
    pause
) else if %mode%==3 (
exit
) else (
    echo.
    echo Invalid option selected. Please choose either 1 or 2.
	echo.
)
echo.
echo.
echo     Install Successful 
echo.

:: THIS FILE IS STILL BEING CONSTRUCTED! (PRE-RELEASE)
