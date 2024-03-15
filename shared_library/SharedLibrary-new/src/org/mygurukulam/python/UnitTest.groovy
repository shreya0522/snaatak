package org.mygurukulam.python

def call() {
    stage('Unit Test') {
        script {
            echo "Executing Python test"
            sh '. myenv/bin/activate'
            sh 'pytest | tee pytest_output.txt'
        }
    }
}

// def test() 
// {
//     echo "Executing Python test"
//     sh '. myenv/bin/activate'
//     sh 'pytest | tee pytest_output.txt'
// }
// return this