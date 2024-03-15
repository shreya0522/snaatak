package org.mygurukulam.common

def call(String version, String credId) {
    stage('Release Artifact') {
        withCredentials([gitUsernamePassword(credentialsId: "${credId}", passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
            script {
                sh "git checkout -b releases/${version}"
                sh "git push origin releases/${version}"
            }
        }
    }
}
