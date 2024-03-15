def call() {
  echo "Scanning for credential leaks"
  sh 'gitleaks detect --report-path gitleaks-report.json'
  }
