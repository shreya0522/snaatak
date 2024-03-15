package org.mygurukulam.Golang

def call() {
    stage('Install Dependency') {
        script {
            sh 'go build'
        }
    }
}
