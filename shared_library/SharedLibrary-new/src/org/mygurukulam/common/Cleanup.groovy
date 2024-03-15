package org.mygurukulam.common

def call() {
    stage('Cleanup') {
        script {
            deleteDir()
        }
    }
}