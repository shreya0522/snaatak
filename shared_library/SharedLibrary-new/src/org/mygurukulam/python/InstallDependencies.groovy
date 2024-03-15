package org.mygurukulam.python

def call() {
    stage('Install Dependencies') {
        script {
            echo "Executing java test"
            sh "sudo apt install pip -y"
            //sh "sudo apt-get install python3-pip"
            sh "sudo apt install -y python3-venv"
            sh "sudo python3 -m venv myenv"
            sh ". myenv/bin/activate"
            sh "python3 -m pip install -r requirements.txt"
            sh "python3 -m pip install flake8-html"
            sh "sudo pip install pylint"
            sh "sudo pip install bandit"
            sh "sudo pip install pytest"
            sh "sudo pip install safety"
        }
    }
}


// def dependencies() 
// {
//     echo "Executing java test"
//     sh 'python3 -m venv myenv'
//     sh '. myenv/bin/activate'
//     sh 'python3 -m pip install -r requirements.txt'
//     sh 'python3 -m pip install flake8-html'
//     sh 'sudo pip install pylint'
//     sh 'sudo pip install bandit'
//     sh 'sudo pip install pytest'
//     sh 'sudo pip install safety'
// }
// return this