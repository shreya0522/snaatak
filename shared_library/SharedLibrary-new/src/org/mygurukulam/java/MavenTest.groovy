package org.mygurukulam.java

def call() {
    stage('Test') {
      script {
        sh "mvn test"
      }    
    }
}
