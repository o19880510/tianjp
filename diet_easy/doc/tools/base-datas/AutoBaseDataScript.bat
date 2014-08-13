echo off
notepad dbconnect.properties
notepad fileList.txt

rem set path=E:\Java\jdk1.5.0\bin
rem set CLASSPATH=E:\Java\jdk1.5.0\lib
del AutoBaseDataScript.log
rem call fileList  > AutoBaseDataScript.log

java -jar "test.jar" fileList.txt > AutoBaseDataScript.log

pause