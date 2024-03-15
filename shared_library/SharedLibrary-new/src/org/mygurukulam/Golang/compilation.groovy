package org.mygurukulam.Golang

def call() {
    stage('Compliation') {
        script {
          echo "Golang code compilation"
          sh 'go install'  
          sh "go list -f '{{.Target}}'"
        }
    }
}

// def call() {
//   echo "Golang code compilation"
//    sh 'go install'  
//    sh "go list -f '{{.Target}}'"
// }
// return this
