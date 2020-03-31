cd "/home/coverity/Desktop/cov-reports/bin/Report_script.sh"
./cov-generate-security-report  webgoat_coverity.yaml --auth-key-file auth-key.txt --on-new-cert trust --output webgoat_coverity.pdf --project webgoat
"cp -r /home/coverity/Desktop/cov-reports/bin/webgoat_coverity.pdf /var/Jenkins/workspace -u"

