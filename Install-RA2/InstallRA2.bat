@echo off
REM download & build OpenRA
git clone https://github.com/OpenRA/OpenRA
cd OpenRA
git checkout b4664d1ec59f37714522268caf55203e96c7fb19
cmd /c make dependencies
cmd /c make all
REM cmd /c make version
cd ..

REM download & build RA2
git clone https://github.com/OpenRA/ra2
cd ra2
echo.
echo Copy and paste the following into the console prompt:
echo %~dp0OpenRA
echo.
cmd /c make dependencies
xcopy "OpenRA.Mods.RA2\dependencies\*" "..\OpenRA" /E /I /Y
cmd /c make all

REM build done, now copy files
set OutDir="%USERPROFILE%\Documents\OpenRA\mods\ra2"
xcopy audio %OutDir%\audio /E /I
xcopy bits %OutDir%\bits /E /I
xcopy chrome %OutDir%\chrome /E /I
xcopy languages %OutDir%\languages /E /I
xcopy maps %OutDir%\maps /E /I
xcopy rules %OutDir%\rules /E /I
xcopy sequences %OutDir%\sequences /E /I
xcopy tilesets %OutDir%\tilesets /E /I
xcopy uibits %OutDir%\uibits /E /I
xcopy weapons %OutDir%\weapons /E /I
xcopy chrome.yaml %OutDir%
xcopy cursors.yaml %OutDir%
xcopy logo.png %OutDir%
xcopy metrics.yaml %OutDir%
xcopy mod.yaml %OutDir%
xcopy preview.png %OutDir%
xcopy weapons.yaml %OutDir%
xcopy OpenRA.Mods.RA2.dll %OutDir%
explorer /select, %~dp0OpenRA\OpenRA.exe