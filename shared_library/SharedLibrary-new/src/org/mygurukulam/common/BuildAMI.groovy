package org.mygurukulam.common

def call(String packerFile) {
    stage('Build ami') {
      script {
        sh "packer init $packerFile"
        sh "packer build $packerFile"
      }    
    }
}
