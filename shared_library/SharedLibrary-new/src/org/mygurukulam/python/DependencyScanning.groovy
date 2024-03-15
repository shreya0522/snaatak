package org.mygurukulam.python

def call() {
    stage('Depndency Scanning') {
        script {
            echo "Executing java test"
            sh '. myenv/bin/activate'
            sh 'safety check -r  pyproject.toml | tee safety_output.txt'
        }
    }
}

// def dependency() 
// {
//     echo "Executing java test"
//     sh '. myenv/bin/activate'
//     sh 'safety check -r  pyproject.toml | tee safety_output.txt'
// }
// return this