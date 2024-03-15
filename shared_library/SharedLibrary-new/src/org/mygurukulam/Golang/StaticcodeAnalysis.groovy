package org.mygurukulam.Golang

def call() {
    stage('Static Code Analysis') {
        script {
            echo "Executing static code analysis"
            withCredentials([string(credentialsId: 'demo', variable: 'tokenn')]) {
        sh """
            sonar-scanner \
            -Dsonar.projectKey=demo \
            -Dsonar.sources=. \
            -Dsonar.host.url=http://192.168.43.113:9000 \
            -Dsonar.token=\${tokenn}
        """
         }
        }
    }
}

// def call() {
//     echo "Executing static code analysis"
//     withCredentials([string(credentialsId: 'demo', variable: 'tokenn')]) {
//         sh """
//             sonar-scanner \
//             -Dsonar.projectKey=demo \
//             -Dsonar.sources=. \
//             -Dsonar.host.url=http://192.168.43.113:9000 \
//             -Dsonar.token=\${tokenn}
//         """
//     }
//     return this
// }
