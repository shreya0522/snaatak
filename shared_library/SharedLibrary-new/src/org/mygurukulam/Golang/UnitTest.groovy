package org.mygurukulam.Golang

def call() {
    stage('Unit Test') {
        script {
            echo "Executing Golang unit test"
            sh 'go test $(go list ./... | grep -v docs | grep -v model | grep -v main.go) -coverprofile cover.out'
            sh 'go tool cover -html=cover.out'
        }
    }
}

// def call()
// {
//     echo "Executing Golang unit test"
//     sh 'go test $(go list ./... | grep -v docs | grep -v model | grep -v main.go) -coverprofile cover.out'
//     sh 'go tool cover -html=cover.out'
    
    
// }
// return this
