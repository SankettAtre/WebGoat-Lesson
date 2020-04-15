echo "*** Scan complete..... Processing generated report for Gating ****"
$result = 'C:\Program Files\Fortify\Fortify_SCA_and_Apps_18.20\bin\FPRUtility.bat' -project 'C:\project\calculator-master\calculator-master\calculator.fpr' -information -search -query "[fortify priority order]:high" -categoryIssueCounts

$issueCount  = ($result -split " ")[0]
Write-Output "High issue count $issueCount"
if ([int]$issueCount   -gt [int]$ENV:HIGH) {
  Write-Output "Total Number of High Category Issues : $issueCount . Max permitted $ENV:HIGH."
  echo "There are existing HIGH category issues."
  #exit 1
}

$result = 'C:\Program Files\Fortify\Fortify_SCA_and_Apps_18.20\bin\FPRUtility.bat' -project calculator.fpr -information -search -query "[fortify priority order]:critical" -categoryIssueCounts

$issueCount  = ($result -split " ")[0]
Write-Output "Critical issue count $issueCount"
if ([int]$issueCount   -gt [int]$ENV:CRITICAL) {
  echo "Total Number of Critical Category Issues : $issueCount . Max permitted $ENV:CRITICAL"
  echo "There are existing Critical category issues."
  exit 1
}
