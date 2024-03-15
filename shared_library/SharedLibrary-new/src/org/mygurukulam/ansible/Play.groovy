package org.mygurukulam.ansible

def call() {
    stage('Setup Monitoring') {
        script {
            withCredentials([sshUserPrivateKey(credentialsId: "infra", keyFileVariable: "ssh_pem")]) {
                sh """
                    ansible-playbook -i ${WORKSPACE}/aws_ec2.yml \
                    --private-key=${ssh_pem} \
                    setup.yml
                """
            }
        }
    }
}
