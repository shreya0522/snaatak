package org.mygurukulam.terraform

def call(String rootPath, String childPath) {
    stage('Infra Cost') {
        withCredentials([string(credentialsId: 'INFRACOST_API_KEY', variable: 'INFRACOST_API_KEY')]){
            script {
                sh "cd ${rootPath}/${childPath} && infracost breakdown --path . --format html > infracost_report.html"
            }
        }
    }
}