package org.mygurukulam.common

def call(String packerFile, String directory) {
    stage('Build AMI with Dir') {
        script {
            sh "cd $directory && packer build $packerFile"
        }
    }
}