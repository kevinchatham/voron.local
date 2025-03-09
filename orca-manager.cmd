@echo off
Title OrcaSlicer_PM
:: #### https://ilkos-home.blogspot.com/p/orca-slicer-pm.html ####

:: #### Prevent console window of closing ####
if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )

:: Vars static
set "version=4.16"
set "_black=[30m"
REM set "_blue=[94m"
set "_cyan=[96m"
set "_gray=[90m"
REM set "_green=[32m"
set "_purple=[35m"
set "_orange=[33m"
REM set "_red=[91m"
set "_white=[97m"
set "_white2=[37m"
set "_warn=[97;41m"
REM set "_warn0=[97;40m"
set "_yellow=[93m"
REM set "_path=%_gray%" & set "_enter=%_white%"
set "_dp0=%~dp0"
set "backup=%_dp0:~0,-1%\OrcaSlicer_profile\"
set "location=%AppData%\OrcaSlicer\"
set "t_end=(call ) & cls & goto :start"
set "tone=start "" /min %comspec% /c "@powershell -c ^(New-Object Media.SoundPlayer "%SystemDrive%\Windows\Media\Windows` Exclamation.wav"^).PlaySync^(^);""

:: check theme
REG QUERY "HKCU\SOFTWARE\OrcaSlicerPM" /v "theme" >nul 2>nul
if not %ErrorLevel% EQU 0 (
	color 0F
	set "_blue=[94m"
	set "_green=[32m"
	set "_red=[91m"
	set "_warn0=[97;40m"
	set "_path=%_gray%" & set "_enter=%_white%"
) else (
	color 8F & set "theme=1"
	set "_blue=[34m"
	set "_green=[92m"
	set "_red=[31m"
	set "_warn0=[97;100m"
	set "_path=%_black%" & set "_enter=%_black%"
)

:start
:: Vars dynamic
set "ready=%_green%Ready%_white%"
set "not_ready=%_red%NOT Ready%_white%"

:: Commands
echo %_cyan%Orca Slicer profile manager v%version%%_white%
echo:
:last
if defined last (
	echo %_yellow%Tasks history :
	echo ===============%_white2%
	echo %last%%_white% & echo: & echo:
)

:task
set "_3=%not_ready%" & REG QUERY "HKLM\SOFTWARE\WOW6432Node\SoftFever" >nul 2>nul
if %ErrorLevel% EQU 0 ( set "_3=%ready%" & set "reg=1" )
if exist "%location%" (
	set "_1=%ready%" & set "_3=%ready%" & set "_4=[ %_path%%location:~0,-1%%_white% ]"
	set "destination=%_path%%backup:~0,-1%%_white%"
) else (
	set "_1=%not_ready%" & set "_4=- %not_ready%"
	set "destination=- %not_ready%"
)
if exist %backup% ( set "_2=%ready%" ) else ( set "_2=%not_ready%" )
echo Backup destination : %destination%
echo:
echo %_yellow%Task list
echo =========%_white%
echo 1. Backup  - %_1%
echo 2. Restore - %_2%
echo 3. Reset   - %_3%
echo 4. Open profile location %_4%
:: Useless... but I gamble you had some fun toggling this off/on many times
echo 5. Toggle theme
echo 6. Clear and refresh
echo 7. About
echo 8. Exit
echo:
:choice
echo %_blue%Enter selection :%_enter%
choice /c 123456789 /n /m "> "
echo %_white%
if %ErrorLevel% EQU 1 ( set "_sel=1" & call :prompt )
if %ErrorLevel% EQU 2 ( set "_sel=" & call :prompt2 )
if %ErrorLevel% EQU 3 ( call :reset )
if %ErrorLevel% EQU 4 ( call :location )
if %ErrorLevel% EQU 5 ( call :theme )
if %ErrorLevel% EQU 6 ( set "last=" & %t_end% )
if %ErrorLevel% EQU 7 ( call :about )
if %ErrorLevel% EQU 8 ( exit )
:: Useless easter egg xD
if %ErrorLevel% EQU 9 ( call :easter_egg )

:location
if not exist "%location%" (
	echo %_yellow%*%_white% The profile directory doesn't exist
	timeout /t 3 /nobreak>nul
	if defined last (
		set "last=%last% & echo %_white2%# %TIME:~0,8% : %_white%Couldn't open location ^(profile missing^)"
	) else (
		set "last=%_white2%# %TIME:~0,8% : %_white%Couldn't open location ^(profile missing^)"
	)
	%t_end%
)
start "%windir%\explorer.exe" "%location%"
if defined last (
	set "last=%last% & echo %_white2%# %TIME:~0,8% : %_white%Opened location"
) else (
	set "last=%_white2%# %TIME:~0,8% : %_white%Opened location"
)
%t_end%
goto :eof

:reset
:: Nothing
if not exist "%location%" (
	if not defined reg (
		echo %_yellow%*%_white% There is nothing to reset ^(profile and registry keys missing^)
	)
		if defined last (
			set "last=%last% & echo %_white2%# %TIME:~0,8% : %_white%Couldn't reset ^(profile and registry keys missing^)"
		) else (
			set "last=%_white2%# %TIME:~0,8% : %_white%Couldn't reset ^(profile and registry keys missing^)"
		)
	timeout /t 3 /nobreak>nul
	%t_end%
)
echo %_warn%* The whole profile directory and registry keys will be deleted when posible%_warn0%
echo %_yellow%*%_white% Ensure you've done a backup before
echo Press %_green%Y%_white% to confirm or %_red%N%_white% to cancel :%_enter%
choice /c yn /n /m "> "
echo:
if %ErrorLevel% EQU 1 (
	call :instance
		:: Reg only
		if not exist "%location%" (
			if defined reg (
				call :reg
			)
				if defined last (
					set "last=%last% & echo %_white2%# %TIME:~0,8% : %_orange%Registry keys deleted%_white% ^(profile missing^)"
				) else (
					set "last=%_white2%# %TIME:~0,8% : %_orange%Registry keys deleted%_white% ^(profile missing^)"
				)
			%t_end%
		)
		:: Profile only
		if exist "%location%" (
			if not defined reg (
				rd /q /s "%location%"
			)
					if defined last (
						set "last=%last% & echo %_white2%# %TIME:~0,8% : %_orange%Profile deleted%_white% ^(Registry keys missing^)"
					) else (
						set "last=%_white2%# %TIME:~0,8% : %_orange%Profile deleted%_white% ^(Registry keys missing^)"
					)
		)
		:: Both
		if exist "%location%" (
			if defined reg (
				rd /q /s "%location%"
				call :reg
			)
					if defined last (
						set "last=%last% & echo %_white2%# %TIME:~0,8% : %_orange%Reset done"
					) else (
						set "last=%_white2%# %TIME:~0,8% : %_orange%Reset done"
					)
		)
	goto :end
)
%t_end%
goto :eof

:reg
REG QUERY "HKLM\SOFTWARE\WOW6432Node\SoftFever" >nul 2>nul
if %ErrorLevel% EQU 0 ( REG DELETE "HKLM\SOFTWARE\WOW6432Node\SoftFever" /f )
:: FUTURE PROOF DELETION
REG QUERY "HKLM\SOFTWARE\SoftFever" >nul 2>nul
if %ErrorLevel% EQU 0 ( REG DELETE "HKLM\SOFTWARE\SoftFever" /f )
goto :eof

:about
echo %_orange%************************************************************
echo *                %_white%Author : ilko (aka Zendama)%_orange%               *
echo *                                                          *
echo *              %_white%Contact and more at my blog :%_orange%               *
echo *              %_yellow%https://ilkos-home.blogspot.com%_orange%              *
echo %_orange%************************************************************%_white% 
echo:
echo Press %_green%Y%_white% to visit the blog or %_red%N%_white% to dismiss :%_enter%
choice /c yn /n /m "> "
echo:
if %ErrorLevel% EQU 1 ( start "" https://ilkos-home.blogspot.com )
if defined last (
	set "last=%last% & echo %_white2%# %TIME:~0,8% : %_white%About read"
) else (
	set "last=%_white2%# %TIME:~0,8% : %_white%About read"
)
%t_end%
goto :eof

:prompt
if not exist "%location%" (
	echo %_yellow%*%_white% Source profile not found, nothing to backup
	timeout /t 3 /nobreak>nul
		if defined last (
			set "last=%last% & echo %_white2%# %TIME:~0,8% : %_white%Couldn't backup ^(profile missing^)"
		) else (
			set "last=%_white2%# %TIME:~0,8% : %_white%Couldn't backup ^(profile missing^)"
		)
	%t_end%
)
if exist "%backup%" ( echo %_yellow%*%_white% The previous backup will be overwritten & call :confirm ) else ( call :ok )
goto :eof

:prompt2
if not exist "%backup%" (
	echo %_yellow%*%_white% Backup profile not found, nothing to restore
	timeout /t 3 /nobreak>nul
		if defined last (
			set "last=%last% & echo %_white2%# %TIME:~0,8% : %_white%Couldn't restore ^(profile missing^)"
		) else (
			set "last=%_white2%# %TIME:~0,8% : %_white%Couldn't restore ^(profile missing^)"
		)
	%t_end%
)
if exist "%location%" ( echo %_yellow%*%_white% The actual profile will be overwritten & call :confirm ) else ( call :ok )
goto :eof

:confirm
echo Press %_green%Y%_white% to confirm or %_red%N%_white% to cancel :%_enter%
choice /c yn /n /m "> "
echo:
if %ErrorLevel% EQU 1 ( call :ok ) else ( %t_end% )
goto :eof

:ok
if defined _sel ( call :backup ) else ( call :restore )
echo: & goto :end
goto :eof

:backup
echo - Processing backup in [ %_path%%backup%%_white% ]
echo:
if exist "%backup%" ( rd /s /q "%backup%" )
xcopy "%location%" "%backup%" /c /i /q /r /s /-y /y
if %ErrorLevel% EQU 0 (
	if defined last (
		set "last=%last% & echo %_white2%# %TIME:~0,8% : %_green%Backup done%_white2%"
	) else (
		set "last=%_white2%# %TIME:~0,8% : %_green%Backup done%_white2%"
	)
) else (
	if defined last (
		set "last=%last% & echo %_white2%# %TIME:~0,8% : %_red%Backup FAILED%_white2%"
	) else (
		set "last=%_white2%# %TIME:~0,8% : %_red%Backup FAILED%_white2%"
	)
)
goto :eof

:restore 
call :instance
echo - Processing restoration in [ %_path%%AppData%\OrcaSlicer%_white% ]
echo:
if exist "%location%" ( rd /s /q "%location%" )
xcopy "%backup%" "%location%"/c /i /q /r /s /-y /y
if %ErrorLevel% EQU 0 (
	if defined last (
		set "last=%last% & echo %_white2%# %TIME:~0,8% : %_green%Restoration done%_white2%"
	) else (
		set "last=%_white2%# %TIME:~0,8% : %_green%Restoration done%_white2%"
	)
) else (
	if defined last (
		set "last=%last% & echo %_white2%# %TIME:~0,8% : %_red%Restoration FAILED%_white2%"
	) else (
		set "last=%_white2%# %TIME:~0,8% : %_red%Restoration FAILED%_white2%"
	)
)
goto :eof

:instance
tasklist /fo csv /nh | findstr /i "orca-slicer.exe">nul
if %ErrorLevel% EQU 0 (
	echo %_yellow%*%_white% Orca Slicer must be closed.
	echo %_enter%^>%_white% Save your work and press %_green%any key%_white% to continue%_white%
	echo: & pause>nul
	taskkill /im "orca-slicer.exe" /t /f>nul
	timeout /t 3 /nobreak>nul
)
goto :eof

:theme
if not defined theme (
	color 8F
	set "theme=1"
	set "_blue=[34m"
	set "_green=[92m"
	set "_red=[31m"
	set "_warn0=[97;100m"
	set "_path=%_black%" & set "_enter=%_black%"
	set "toggle=Light theme toggled"
	REG ADD "HKCU\SOFTWARE\OrcaSlicerPM" /v "theme" /t REG_SZ /d "1" /f >nul 2>nul
) else (
	color 0F
	set "theme="
	set "_blue=[94m"
	set "_green=[32m"
	set "_red=[91m"
	set "_warn0=[97;40m"
	set "_path=%_gray%" & set "_enter=%_white%"
	set "toggle=Dark theme toggled"
	REG DELETE "HKCU\SOFTWARE\OrcaSlicerPM" /v "theme" /f >nul 2>nul
)
if defined last (
	set "last=%last% & echo %_white2%# %TIME:~0,8% : %_white%%toggle%"
) else (
	set "last=%_white2%# %TIME:~0,8% : %_white%%toggle%"
)
%t_end%
goto :eof

:easter_egg
%tone%
if defined last (
	set "last=%last% & echo %_white2%# %TIME:~0,8% : %_purple%Played easter egg sound%_white2%"
) else (
	set "last=%_white2%# %TIME:~0,8% : %_purple%Played easter egg sound%_white2%"
)
%t_end%
goto :eof

:end
if %ErrorLevel% EQU 0 ( goto :success )
:fail
start "" /min "%comspec%" /c "@powershell -c (New-Object Media.SoundPlayer "%SystemDrive%\Windows\Media\Windows` Ding.wav").PlaySync();"
echo !!!!!!!!!!!
echo !  %_red%ERROR%_white%  !
echo !!!!!!!!!!!
echo %_enter%^>%_white% Press any key to restart
echo: & pause>nul
%t_end%
:success
start "" /min "%comspec%" /c "@powershell -c (New-Object Media.SoundPlayer "%SystemDrive%\Windows\Media\Windows` Notify.wav").PlaySync();"
echo %_orange%**************
echo *    %_green%DONE%_orange%    *
echo **************%_white%
echo: & timeout /t 3 /nobreak>nul & %t_end%


