setLocal enabledelayedexpansion

pushd %~dp0..\..\
set BASE_DIR=%CD%
popd

IF ["%AMBRY_LOG4J_OPTS%"] EQU [""] (
    set AMBRY_LOG4J_OPTS=-Dlog4j.configuration=file:%BASE_DIR%\config\log4j.properties
)

IF ["%AMBRY_SERVER_PROPS%"] EQU [""] (
    set AMBRY_SERVER_PROPS=--serverPropsFilePath=%BASE_DIR%\config\server.properties
)

IF ["%AMBRY_PART_PROPS%"] EQU [""] (
    set AMBRY_PART_PROPS=--partitionLayoutFilePath=%BASE_DIR%\config\PartitionLayout.json
)

IF ["%AMBRY_HARDWARE_PROPS%"] EQU [""] (
    set AMBRY_HARDWARE_PROPS=--hardwareLayoutFilePath=%BASE_DIR%\config\HardwareLayout.json
)

IF ["%CLASSPATH%%"] EQU [""] (
    set CLASSPATH=-jar %BASE_DIR%\target\ambry.jar
)

IF ["%JAVA_HOME%"] EQU [""] (
	set JAVA=java
) ELSE (
	set JAVA="%JAVA_HOME%/bin/java"
)

set COMMAND=%JAVA% %AMBRY_LOG4J_OPTS% %CLASSPATH% %AMBRY_SERVER_PROPS%  %AMBRY_PART_PROPS%  %AMBRY_HARDWARE_PROPS%
rem echo.
rem echo %COMMAND%
rem echo.

%COMMAND%

