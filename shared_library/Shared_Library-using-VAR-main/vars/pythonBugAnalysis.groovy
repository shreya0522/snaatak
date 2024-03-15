def call()
{
    echo "Executing python bug anlysis"
    // Run bandit for security analysis
    sh 'bandit -r . -f html -o bandit_report.html || true'
}

