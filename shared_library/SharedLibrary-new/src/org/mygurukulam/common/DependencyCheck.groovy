package org.mygurukulam.common

def call(String project) {
    stage('Dependency check') {
      script {
        def currentWorkspace = pwd()
        dependencyCheck additionalArguments: "--project ${project} --scan ${currentWorkspace} --format HTML", odcInstallation: 'DP-Check'
      }    
    }
}
