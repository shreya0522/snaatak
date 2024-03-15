package org.mygurukulam.common

def call(String path) {
    stage('CredScanning') {
        script {
            sh "cd ${path} && gitleaks detect --report-path gitleaks-report.json"
        }
    }
}
