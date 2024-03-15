package org.mygurukulam.frontend

def call() {
    stage('Build') {
      script {
        sh 'npm run build || true'
      }    
    }
}
