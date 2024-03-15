package org.mygurukulam.common

def call(String dir) {
    stage('Zip static files') {
      script {
       sh "zip -r frontend.zip ${dir}"
      }    
    }
}