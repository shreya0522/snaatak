package org.mygurukulam.python

def call() {
    stage('Bug Analysis') {
        script {
            echo "Executing python bug anlysis"
            // Run bandit for security analysis
            sh 'bandit -r . -f html -o bandit_report.html || true'
        }
    }
}

// def analysis() 
// {
//     echo "Executing python bug anlysis"
//     // Run bandit for security analysis
//     sh 'bandit -r . -f html -o bandit_report.html || true'
// }
// return this