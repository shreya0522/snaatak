package org.mygurukulam.java

def call() {
    stage('Bug Analysis') {
      script {
        sh 'mvn spotbugs:spotbugs'
        sh 'mvn site'
        sh "mvn package"
      }    
    }
}
