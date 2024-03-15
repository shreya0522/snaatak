package org.mygurukulam.terraform

def call(String rootPath, String childPath) {
    stage("Terraform apply") {
        script {
            sh "cd ${rootPath}/${childPath} && terraform apply -auto-approve"
        }
    }
}