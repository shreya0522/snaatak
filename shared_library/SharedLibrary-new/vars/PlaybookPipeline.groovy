def call(Map config = [:]) {
    pipeline {
        agent any

        stages {
            stage('Checkout') {
                steps {
                    script {
                        def checkout = new org.mygurukulam.common.Checkout()
                        checkout.clone(config.url, config.creds, config.branch)
                    }
                }
            }

            stage('Run Ansible Playbook') {
                steps {
                    script {
                        def y = new org.mygurukulam.ansible.PlaybookCommand()
                        y.runAnsiblePlaybook(config.inventoryPath, config.testPlaybookPath)
                    }
                }
            }
        }
    }
}
