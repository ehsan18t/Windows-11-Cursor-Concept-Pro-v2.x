@echo off

FLTMC >NUL 2>&1 || (
    ECHO  Please run this file as admin to continue...
    ECHO.
	ECHO  ^=^> Press Any Key To Exit
    PAUSE >NUL 2>&1
	EXIT
)

SET "desktop=%userprofile%\Desktop"

echo.
echo    If your install.inf is not working, you can use this cmd as its alternative. (Windows)
echo.

Echo.
Echo.
echo    Downloading the 'Instructions.txt' file... Check your Downloads folder or Desktop.
echo.
echo.
SET "DL_Link=https://gist.githubusercontent.com/PSGitHubUser1/8244f8a80ccc119c1d50f047a0af2170/raw/22516ac287ae5fc41b58d922f10af87aa6e14ca4/Instructions.txt"
SET "DL_Location=%desktop%\Instructions.txt"
Call :Any_Downloader
echo. 
echo.
Echo    FOLLOW INSTRUCTIONS GIVEN IN "Instructions.txt"
Echo.
echo.
echo.
SET "downloaded_cursor=%desktop%\W11-CC-V2.2-HDPI-by-Jepri"
SET "cursor_zip=W11-CC-V2.2-HDPI-by-Jepri.zip"
mkdir "%downloaded_cursor%"
echo.
SET "DL_Link=https://github.com/PSGitHubUser1/Windows-11-Cursor-Concept-Pro-v2.x/releases/download/v2.2pro_NEW/%cursor_zip%"
SET "DL_Location=%desktop%\%cursor_zip%"
Call :Any_Downloader
echo.
powershell -command "Expand-Archive -Path '%desktop%\%cursor_zip%' -DestinationPath '%downloaded_cursor%'"
echo.
del "%desktop%\%cursor_zip%"
echo.
echo.
echo.
echo     Please choose a cursor color:  
echo       1. Light color
echo       2. Dark color
echo       3. Exit
echo.
echo.
CHOICE /C:123 /N /M "Choose a color (only one option to choose, no go back option): "
IF ERRORLEVEL 3 EXIT
IF ERRORLEVEL 2 CALL :DARK
IF ERRORLEVEL 1 CALL :LIGHT

echo.

@REM Installation Process
mkdir "%WinDir%\Cursors\Win11_%mode%_HD_Cursors"
XCOPY /I /Y /E "%downloaded_cursor%\%mode%\regular\base" "%WinDir%\Cursors\Win11_%mode%_HD_Cursors"
DEL "%downloaded_cursor%\%mode%\regular\01. default\Install.inf"
XCOPY /I /Y /E "%downloaded_cursor%\%mode%\regular\01. default" "%WinDir%\Cursors\Win11_%mode%_HD_Cursors"

echo.
echo.
echo     Install Successful 
echo.
echo     PLEASE NOW FOLLOW THE INSTRUCTIONS...
echo.
RMDIR /S /Q "%downloaded_cursor%" >nul
notepad.exe "%desktop%\Instructions.txt"
DEL "%desktop%\Instructions.txt"

EXIT


:DARK
SET "mode=dark"
EXIT /B

:LIGHT
SET "mode=light"
EXIT /B


:Any_Downloader
PowerShell -Command ^
$ProgressPreference = 'SilentlyContinue';^
$dlLink = \"%DL_Link%\";^
$dlLocation = \"%DL_Location%\";^
function downloadFile($url, $targetFile)^
{^
    $uri = New-Object \"System.Uri\" \"$url\";^
    $request = [System.Net.HttpWebRequest]::Create($uri);^
    $request.set_Timeout(15000);^
    $response = $request.GetResponse();^
    $totalLength = [System.Math]::Floor($response.get_ContentLength()/1024);^
    $responseStream = $response.GetResponseStream();^
    $targetStream = New-Object -TypeName System.IO.FileStream -ArgumentList $targetFile, Create;^
    $buffer = new-object byte[] 10KB;^
    $count = $responseStream.Read($buffer,0,$buffer.length);^
    $downloadedBytes = $count;^
    while ($count -gt 0)^
    {^
        [System.Console]::CursorLeft = 0;^
        [System.Console]::Write(\"  >>   Downloaded {0}K of {1}K ({2}%%) <<   \", [System.Math]::Floor($downloadedBytes/1024), $totalLength, [System.Math]::Floor((($downloadedBytes/1024)/$totalLength)*100));^
        $targetStream.Write($buffer, 0, $count);^
        $count = $responseStream.Read($buffer,0,$buffer.length);^
        $downloadedBytes = $downloadedBytes + $count;^
    }^
    $targetStream.Flush();^
    $targetStream.Close();^
    $targetStream.Dispose();^
    $responseStream.Dispose();^
}^
downloadFile $dlLink $dlLocation;

ECHO.
EXIT /B


@REM :: THIS FILE IS STILL BEING CONSTRUCTED! (PRE-RELEASE)
