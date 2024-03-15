package org.mygurukulam.python

def call() {
    stage('Static Code Analysis') {
        script {
            echo "Executing bug analysis"
            sh '. myenv/bin/activate'
            sh 'pylint --disable=R0022,R0903,E0611,E0602,F0010,C0330,C0326,C0304,E0401,C0111,R0801,W0621,W0613,W0612,W0611,C0411,R0201,C0301,C0103,R1705,E1120,R1725,R0124 router/ client/ models/ utils/ app.py'
            sh 'pylint | tee pylint_output.txt'
        }
    }
}


//def analysis() 
// {
//     echo "Executing bug analysis"
//     sh '. myenv/bin/activate'
//     // Run flake8 for style checking
//     //sh 'sudo flake8 . | tee flake8_output.txt'
//     // Run pylint for code analysis
//     sh 'pylint --disable=R0022,R0903,E0611,E0602,F0010,C0330,C0326,C0304,E0401,C0111,R0801,W0621,W0613,W0612,W0611,C0411,R0201,C0301,C0103,R1705,E1120,R1725,R0124 router/ client/ models/ utils/ app.py'
//     sh 'pylint | tee pylint_output.txt'
// }
// return this