@echo off
setlocal

set /p search_dir=Enter the search directory (e.g. C:\Users\austen.green\Desktop):
set /p file_type=Enter the file type to search (e.g. *.txt):
set /p start_date=Enter the start date for the search (MM/DD/YYYY):
set /p end_date=Enter the end date for the search (MM/DD/YYYY):
set /p keyword=Enter the keyword to search for:

set "start_time=%time%"

for /r %search_dir% %%f in (%file_type%) do (
    findstr /i /m /c:"%keyword%" "%%f" && (
        echo %%f
    )
)

set "end_time=%time%"
set "time_diff="

rem Calculate time difference
for /f "tokens=1-4 delims=:." %%a in ("%start_time%") do (
    set /a "start_seconds=(((%%a*60)+1%%b%%100)*60)+1%%c%%100"
)
for /f "tokens=1-4 delims=:." %%a in ("%end_time%") do (
    set /a "end_seconds=(((%%a*60)+1%%b%%100)*60)+1%%c%%100"
)
set /a "time_diff=end_seconds-start_seconds"

echo ....................................
echo         Search complete
echo ....................................
echo Time taken: %time_diff% seconds
pause

REM Example use:
REM Enter the search directory (e.g. C:\Users\austen.green\Desktop): C:\Users\JohnDoe\Documents
REM Enter the file type to search (e.g. *.txt): *.docx
REM Enter the start date for the search (MM/DD/YYYY): 01/01/2021
REM Enter the end date for the search (MM/DD/YYYY): 12/31/2021
REM Enter the keyword to search for: confidential

REM The script will then search for all .docx files containing the keyword "confidential" within the specified date range in the directory "C:\Users\JohnDoe\Documents". Once complete, it will display the time taken to complete the search.
