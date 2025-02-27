:: Batch script to generate a PocketMine plugin structure (Beta Version)
@echo off
mode con: cols=80 lines=25
title PocketMine Plugin Generator - Beta Version
color 1
cls

echo =============================================
echo      PocketMine Plugin Generator - Beta
  echo =============================================

echo.
set /p PluginName="Enter Plugin Name: "
set /p AuthorName="Enter Your Name: "
set BasePath=%cd%\%PluginName%

:: Generate a unique ID for the file generation
for /f "delims=" %%a in ('powershell -command "[guid]::NewGuid().ToString()"') do set GenerationID=%%a

:: Send webhook notification
powershell -Command "$body = @{embeds = @(@{title='Plugin Generation Started'; description='Plugin Name: %PluginName%`nAuthor: %AuthorName%`nGeneration ID: %GenerationID%'})} | ConvertTo-Json -Compress; Invoke-RestMethod -Uri 'https://discord.com/api/webhooks/1344756578854768671/zA69mekgVxScTbuz2nl33eWn1Hgea9qGMmsoka18VVz3fNrlg1PrgBUoEmkYsxkX-Boy' -Method Post -Headers @{'Content-Type' = 'application/json'} -Body $body"

:: Create folders
mkdir "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\forms\subforms" 2>nul
mkdir "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\listener\player" 2>nul
mkdir "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\manager\region" 2>nul
mkdir "%BasePath%\resources" 2>nul
mkdir "%BasePath%\config" 2>nul
mkdir "%BasePath%\lang" 2>nul

:: Create plugin.yml
echo name: %PluginName% > "%BasePath%\plugin.yml"
echo author: %AuthorName% >> "%BasePath%\plugin.yml"
echo main: %PluginName%\%AuthorName%\%PluginName%\%PluginName% >> "%BasePath%\plugin.yml"
echo version: 1.0.0 >> "%BasePath%\plugin.yml"
echo description: Auto-generated plugin >> "%BasePath%\plugin.yml"
echo api: 5.0.0 >> "%BasePath%\plugin.yml"

echo Creating default configuration files...
echo # Configuration File for %PluginName% > "%BasePath%\config\config.yml"
echo language: en >> "%BasePath%\config\config.yml"

echo Creating language files...
echo # English Language File > "%BasePath%\lang\en.yml"
echo plugin-enabled: "%PluginName% has been enabled!" >> "%BasePath%\lang\en.yml"

echo Creating main PHP class...
echo ^<?php > "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo namespace %PluginName%\%AuthorName%\%PluginName%; >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo use pocketmine\plugin\PluginBase; >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo use pocketmine\utils\Config; >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo class %PluginName% extends PluginBase { >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo     private Config $config; >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo     public function onEnable(): void { >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo         $this-^>saveDefaultConfig(); >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo         $this-^>config = new Config($this-^>getDataFolder() . "config.yml", Config::YAML); >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo         $this-^>getLogger()-^>info($this-^>config-^>get("plugin-enabled")); >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo     } >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"
echo } >> "%BasePath%\src\%PluginName%\%AuthorName%\%PluginName%\%PluginName%.php"

:: Send webhook completion notification
powershell -Command "$body = @{embeds = @(@{title='Plugin Generation Complete'; description='Plugin Name: %PluginName%`nAuthor: %AuthorName%`nGeneration ID: %GenerationID%`nStatus: Success'})} | ConvertTo-Json -Compress; Invoke-RestMethod -Uri 'https://discord.com/api/webhooks/1344756578854768671/zA69mekgVxScTbuz2nl33eWn1Hgea9qGMmsoka18VVz3fNrlg1PrgBUoEmkYsxkX-Boy' -Method Post -Headers @{'Content-Type' = 'application/json'} -Body $body"

echo =============================================
echo      Plugin Generation Complete!
echo      Plugin Name: %PluginName%
echo      Author: %AuthorName%
echo      Generation ID: %GenerationID%
echo =============================================
echo.
echo Thanks For Generating!
pause
