cd "C:\Program Files\Fortify\Fortify_SCA_and_Apps_19.1.0\bin"
"sourceanalyzer.exe" -64 -b "webgoat" -clean
echo 'fortify SAST clean complete'
cd "C:\Program Files\Fortify\Fortify_SCA_and_Apps_19.1.0\bin"
"sourceanalyzer.exe" -64 -b "calc" -source "1.8" "C:\project\WebGoat-Lessons-develop"
echo 'SAST translate complete'
cd "C:\Program Files\Fortify\Fortify_SCA_and_Apps_19.1.0\bin"
"sourceanalyzer.exe" -64 -b "calc" -format "fpr" -f "C:\project\WebGoat-Lessons-develop\webgoat.fpr" -scan
echo 'SAST scan complete'
cd "C:\Program Files\Fortify\Fortify_SCA_and_Apps_19.1.0\bin"
ReportGenerator.bat -template "DeveloperWorkbook.xml"  -format "pdf" -f "C:\project\WebGoat-Lessons-develop\webgoat.pdf" -source "C:\project\WebGoat-Lessons-develop\webgoat.pdf"
