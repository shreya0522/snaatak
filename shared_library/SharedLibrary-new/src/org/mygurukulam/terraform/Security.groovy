package org.mygurukulam.terraform

def call(String rootPath, String childPath) {
    stage('Security/Compliance') {
        script {
            sh "cd ${rootPath}/${childPath} && checkov --directory . || true"
        }
    }
}