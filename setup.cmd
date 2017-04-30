@ECHO OFF
REM Sets up the environment for the script to run

.paket\paket.bootstrapper.exe
if errorlevel 1 (
  exit /b %errorlevel%
)

.\.paket\paket restore
if errorlevel 1 (
  exit /b %errorlevel%
)

REM need to copy all DLLs to the same location otherwise Google can't find Newtonsoft.Json
xcopy .\packages\Google.Apis.Calendar.v3\lib\net45\*.dll .\bin\ /y
xcopy .\packages\Google.Apis.Auth\lib\net45\*.dll .\bin\ /y
xcopy .\packages\Google.Apis\lib\net45\*.dll .\bin\ /y
xcopy .\packages\Google.Apis.Core\lib\net45\*.dll .\bin\ /y
xcopy .\packages\Newtonsoft.Json\lib\net45\*.dll .\bin\ /y

