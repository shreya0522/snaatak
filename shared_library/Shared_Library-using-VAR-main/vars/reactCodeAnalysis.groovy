def call() {
    withCredentials([string(credentialsId: "${cred}", variable: 'token')]) {
                    sh """
                         sonar-scanner-5.0.1.3006-linux/bin/sonar-scanner \
                        -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
                        -Dsonar.sources=${SONAR_SOURCES} \
                        -Dsonar.host.url=${SONAR_HOST_URL} \
                        -Dsonar.token=${token}
                    """
                }
}
