:: Batch Script By Phrqndy, Open Source...
@echo off
set /p PluginName="Enter Plugin Name: "
set /p AuthorName="Enter Your Name: "
set BasePath=%cd%\%PluginName%

:: Generate a ID for file generation
for /f "delims=" %%a in ('powershell -command "[guid]::NewGuid().ToString()"') do set GenerationID=%%a

:: Send webhook for Support (Since This Project Is Free)
powershell -Command "$body = @{embeds = @(@{title='Plugin Generation Started'; description='Plugin Name: %PluginName%`nAuthor: %AuthorName%`nGeneration ID: %GenerationID%'})} | ConvertTo-Json -Compress; Invoke-RestMethod -Uri 'https://discord.com/api/webhooks/1344756578854768671/zA69mekgVxScTbuz2nl33eWn1Hgea9qGMmsoka18VVz3fNrlg1PrgBUoEmkYsxkX-Boy' -Method Post -Headers @{'Content-Type' = 'application/json'} -Body $body"

:: Create folders
mkdir "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\forms\subforms" 2>nul
mkdir "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\listener\player" 2>nul
mkdir "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\manager\region" 2>nul

:: Create plugin.yml
echo name: %PluginName% > "%BasePath%\plugin.yml"
echo author: %AuthorName% >> "%BasePath%\plugin.yml"
echo main: %PluginName%\\%AuthorName%\\%PluginName%\\%PluginName% >> "%BasePath%\plugin.yml"
echo version: 1.0.0 >> "%BasePath%\plugin.yml"
echo description: Auto-generated plugin >> "%BasePath%\plugin.yml"
echo api: 5.0.0 >> "%BasePath%\plugin.yml"

:: Create PHP files
echo ^<?php > "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo namespace %PluginName%\\%AuthorName%\\%PluginName%; >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo use pocketmine\\plugin\\PluginBase; >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo class %PluginName% extends PluginBase { >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo     public function onEnable(): void { >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo         $this-^>getLogger()-^>info("%PluginName% has been enabled!"); >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo     } >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo } >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"

:: Send webhook completion notification
powershell -Command "$body = @{embeds = @(@{title='Plugin Generation Complete'; description='Plugin Name: %PluginName%`nAuthor: %AuthorName%`nGeneration ID: %GenerationID%`nStatus: Success'})} | ConvertTo-Json -Compress; Invoke-RestMethod -Uri 'https://discord.com/api/webhooks/1344756578854768671/zA69mekgVxScTbuz2nl33eWn1Hgea9qGMmsoka18VVz3fNrlg1PrgBUoEmkYsxkX-Boy' -Method Post -Headers @{'Content-Type' = 'application/json'} -Body $body"

echo Ay Thanks For Using My Generator [Github: PhrqndyDevs]
echo Github Script ID: 924 (Ignore)
pause