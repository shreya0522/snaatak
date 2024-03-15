package org.mygurukulam.java

def call() {
    stage('Compile') {
      script {
        sh "mvn clean package"
      }    
    }
}
