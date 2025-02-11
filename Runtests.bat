@echo off
@REM robot --outputdir .\CustomReport .\TestCases
@REM robot --outputdir .\Reports -A Sequence.txt
@REM Trying to get custom Report
cd "%CD%\Custom Report"
del *.txt
type nul>log.txt
cd ../
robot -d "Custom Report" -i SDMS .
cd "%CD%\Custom Report"
py Custom_Report.pyc