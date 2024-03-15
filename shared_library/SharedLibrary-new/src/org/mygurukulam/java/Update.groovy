package org.mygurukulam.java

def call(String version, String packerFile) {
    stage('Change version') {
      script {
        sh "sed -i 's/ami_name = \"salary-v[0-9.]*\"/ami_name = \"salary-v${version}.0\"/' $packerFile"
        sh "sed -i 's/app = \"salary-v[0-9.]*\"/app = \"salary-v${version}.0\"/' $packerFile"
      }    
    }
}
