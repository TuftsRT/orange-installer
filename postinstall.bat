@ECHO OFF

ECHO Configuring Orange... Do not close command prompt.

IF "%PREFIX:users=%"=="%PREFIX%" (
    REM systemwide installation
    FOR /F "delims=" %%d IN ('dir /AD /B "%SYSTEMDRIVE%\Users"') DO (
        IF /I "%%d" NEQ "All Users" (
            IF /I "%%d" NEQ "Default User" (
                IF /I "%%d" NEQ "Public" (
                    IF NOT EXIST "%SYSTEMDRIVE%\Users\%%d\AppData\Roaming\biolab.si\" (
                        MKDIR "%SYSTEMDRIVE%\Users\%%d\AppData\Roaming\biolab.si"
                    )
                    (
                        ECHO [notifications]
                        ECHO check-notifications=false
                        ECHO.
                        ECHO [reporting]
                        ECHO send-statistics=false
                        ECHO.
                        ECHO [startup]
                        ECHO check-updates=false
                    ) > "%SYSTEMDRIVE%\Users\%%d\AppData\Roaming\biolab.si\orange.ini"
                )
            )
        )
    )
) ELSE (
    REM single user installation
    IF NOT EXIST "%APPDATA%\biolab.si\" (
        MKDIR "%APPDATA%\biolab.si
    )
    (
        ECHO [notifications]
        ECHO check-notifications=false
        ECHO.
        ECHO [reporting]
        ECHO send-statistics=false
        ECHO.
        ECHO [startup]
        ECHO check-updates=false
    ) > "%APPDATA%\biolab.si\orange.ini"
)
