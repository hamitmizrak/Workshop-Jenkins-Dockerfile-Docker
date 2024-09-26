@echo off

REM Sertifika dosyası ve alias ismi
set CERT_FILE=jenkins-cert.pem
set CERT_ALIAS=jenkins-cert

REM JAVA_HOME kontrolü
if "%JAVA_HOME%"=="" (
    echo JAVA_HOME degiskeni tanimli degil. Lütfen JAVA_HOME'u ayarlayın.
    exit /b 1
)

REM Keytool komutunu çalıştır
"%JAVA_HOME%\bin\keytool" -import -alias %CERT_ALIAS% -keystore "%JAVA_HOME%\lib\security\cacerts" -file %CERT_FILE% -storepass changeit -noprompt

if %errorlevel%==0 (
    echo Sertifika basariyla yüklendi.
) else (
    echo Sertifika yükleme basarisiz oldu.
    exit /b 1
)
