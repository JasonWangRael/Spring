@echo off
setlocal enabledelayedexpansion
set FileName=2001.xml
set index=1

REM 写入表头部分
echo ^<?xml version="1.0" encoding="UTF-8"?^> >> %FileName%
echo 	^<CFX^> >> %FileName%

for /F "tokens=1,2-15 delims=," %%a in (example-noComma.txt) do (
	if !index!==1 (
		REM 处理HEAD
		echo 	^<HEAD^> >> %FileName%
		echo 		^<VER^>%%a^</VER^> >> %FileName%
		echo 		^<SRC^>%%b^</SRC^> >> %FileName%
		echo 		^<DES^>%%c^</DES^> >> %FileName%
		echo 		^<APP^>%%d^</APP^> >> %FileName%
		echo 		^<MsgNo^>%%e^</MsgNo^> >> %FileName%
		echo 		^<MsgID^>%%f^</MsgID^> >> %FileName%
		echo 		^<MsgRef^>%%e^</MsgRef^> >> %FileName%
		echo 		^<WorkDate^>%%g^</WorkDate^> >> %FileName%
		echo 	^</HEAD^> >> %FileName%
		set /a index=!index!+1
		GOTO CONTINUE
	)
	
	if !index!==2 (
		REM 处理BatchHead2001
		echo ^<MSG^> >> %FileName%
		echo ^<BatchHead2001^> >> %FileName%
		echo ^<jrjgbm^>%%a^</jrjgbm^> >> %FileName%
		echo ^<jrjgmc^>%%b^</jrjgmc^> >> %FileName%
		echo ^<wtrq^>%%c^</wtrq^> >> %FileName%
		echo ^<blsh^>%%d^</blsh^> >> %FileName%
		echo ^</BatchHead2001^> >> %FileName%
		set /a index=!index!+1
		GOTO CONTINUE
	)

	if %%a==ORGINFO (
		REM 处理ORGINFO
		if !index!==3 echo ^</OrgInfo^> >> %FileName%
		
		echo ^<OrgInfo^> >> %FileName%
		echo ^<wddm^>%%b^</wddm^> >> %FileName%
		echo ^<wdmc^>%%c^</wdmc^> >> %FileName%
		GOTO CONTINUE
	)
	
	REM 处理Detail
	echo ^<Detail^> >> %FileName%
	echo ^<bsh^>%%a^</bsh^> >> %FileName%
	echo ^<sxh^>%%b^</sxh^> >> %FileName%
	echo ^<fhzlb^>%%c^</fhzlb^> >> %FileName%
	echo ^<zh^>%%d^</zh^> >> %FileName%
	echo ^<jyrq^>%%e^</jyrq^> >> %FileName%
	echo ^<jysj^>%%f^</jysj^> >> %FileName%
	echo ^<jyjgdm^>%%g^</jyjgdm^> >> %FileName%
	echo ^<yjkmdm^>%%h^</yjkmdm^> >> %FileName%
	echo ^<ejkmdm^>%%i^</ejkmdm^> >> %FileName%
	echo ^<sjkmdm^>%%j^</sjkmdm^> >> %FileName%
	echo ^<jffse^>%%k^</jffse^> >> %FileName%
	echo ^<dffse^>%%l^</dffse^> >> %FileName%
	echo ^<ye^>%%m^</ye^> >> %FileName%
	echo ^<yejdbz^>%%n^</yejdbz^> >> %FileName%
	echo ^<zy^>%%o^</zy^> >> %FileName%
	echo ^</Detail^> >> %FileName%
)

echo ^</OrgInfo^> >> %FileName%
echo ^</MSG^> >> %FileName%
echo ^</CFX^> >> %FileName%
REM Pause