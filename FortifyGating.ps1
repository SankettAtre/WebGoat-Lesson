param (
 [Int] $HIGH = 241,
 [Int] $CRITICAL=596,
 [Int] $MEDIUM=23,
 [Int] $LOW=24
 )

echo "*** Scan complete..... Processing generated report for Gating ****"
$result= FPRUtility.bat -project C:\project\WebGoat-Lessons-develop\webgoat.fpr -information -search -query "[fortify priority order]:high" -categoryIssueCounts
$issueCount  = ($result -split " ")[0]
Write-Output "High issue count $issueCount"
#if ('[([int]$issueCount -ne "No" -and [int]$issueCount  -gt [int]$ENV:HIGH)]')
if ([int]$issueCount   -gt $HIGH)
{
  Write-Output "Total Number of High Category Issues : $issueCount"
  echo "There are existing HIGH category issues."
  echo "Failing Gating as Issue count is greater than existing issue"
  exit 1
} 
$result = FPRUtility.bat -project C:\project\WebGoat-Lessons-develop\webgoat.fpr -information -search -query "[fortify priority order]:critical" -categoryIssueCounts

$issueCount  = ($result -split " ")[0]
Write-Output "Critical issue count $issueCount"
#if ($issueCount -ne "50" -and [int]$issueCount   -gt [int]$ENV:CRITICAL)
if ([int]$issueCount   -gt $CRITICAL)
  {echo "Total Number of Critical Category Issues : $issueCount"
 # echo "There are existing Critical category issues. "
  echo "The Build Failing as Issue count is greater than 20"
  exit 1
  }

$result = FPRUtility.bat -project C:\project\WebGoat-Lessons-develop\webgoat.fpr -information -search -query "[fortify priority order]:Medium" -categoryIssueCounts

$issueCount  = ($result -split " ")[0]
Write-Output "Medium issue count $issueCount"
if ([int]$issueCount   -gt $MEDIUM)
#if ($issueCount -ne "20" -and [int]$issueCount   -gt [int]$ENV:MEDIUM)
  {echo "Total Number of Medium Category Issues : $issueCount"
  #echo "There are existing Medium category issues."
  #echo "Failing Gating as Issue count is greater than existing issue"
  echo "Gating applied on MEDIUM issues; as Issue count is greater than"$MEDIUM
  exit 1
  }

$result = FPRUtility.bat -project C:\project\WebGoat-Lessons-develop\webgoat.fpr -information -search -query "[fortify priority order]:Low" -categoryIssueCounts
$issueCount  = ($result -split " ")[0]
if ([int]$issueCount   -gt $LOW){
#if ($issueCount -ne "No" -and [int]$issueCount   -gt [int]$ENV:LOW) {
  echo "Total Number of Low Category Issues : $issueCount"
  echo "There are existing Low category issues."
  echo "Failing Gating as Issue count is greater than existing issue"
  exit 1
}
