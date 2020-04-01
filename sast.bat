cd "C:\Program Files\Fortify\Fortify_SCA_and_Apps_18.20\bin"
"sourceanalyzer.exe" -64 -b "calc" -clean
echo 'fortify SAST clean complete'
cd "C:\Program Files\Fortify\Fortify_SCA_and_Apps_18.20\bin"
"sourceanalyzer.exe" -64 -b "calc" -source "1.8" "C:\Program Files (x86)\Jenkins\workspace\Fortify\target\calculator"
echo 'SAST translate complete'
cd "C:\Program Files\Fortify\Fortify_SCA_and_Apps_18.20\bin"
"sourceanalyzer.exe" -64 -b "calc" -format "fpr" -f "C:\project\calculator-master\calculator-master\calculator.fpr" -scan
echo 'SAST scan complete'
cd "C:\Program Files\Fortify\Fortify_SCA_and_Apps_18.20\bin"
ReportGenerator.bat -template "DeveloperWorkbook.xml"  -format "pdf" -f "C:\project\calculator-master\calculator-report.pdf" -source "C:\project\calculator-master\calculator.fpr"
