def call(Map config = [:]) {
    pipeline {
        agent any

        parameters {
            booleanParam(name: 'SKIP_YAML_LINTING', defaultValue: false, description: 'Skip yaml linting stage')
            booleanParam(name: 'SKIP_SYNTAX', defaultValue: false, description: 'Skip syntax for stage')
            booleanParam(name: 'SKIP_LINTING', defaultValue: false, description: 'Skip linting for stage')
            booleanParam(name: 'SKIP_CREDENTIAL_SCANNING', defaultValue: false, description: 'Skip credential scanning stage')
        }

        stages {

            stage('Checkout') {
                steps {
                    script {
                        def checkout = new org.mygurukulam.common.Checkout()
                        checkout.clone(config.url, config.creds, config.branch)
                    }
                }
            }

            stage('Credentials scanning') {

                when {
                    expression { params.SKIP_CREDENTIAL_SCANNING == false }
                }

                steps {
                    script {
                        def c = new org.mygurukulam.common.CredentialScanning()
                        c.scane()
                    }
                }
            }

            stage('Linting') {

                when {
                    expression { params.SKIP_LINTING == false }
                }

                steps {
                    script {
                        def l = new org.mygurukulam.ansible.Lint()
                        l.checkLinting(config.path)
                    }
                }
            }

            stage('Syntax') {

                when {
                    expression { params.SKIP_SYNTAX == false }
                }

                steps {
                    script {
                        def s = new org.mygurukulam.ansible.Syntax()
                        s.check(config.path)
                    }
                }
            }

            stage('Yaml linting') {

                when {
                    expression { params.SKIP_YAML_LINTING == false }
                }

                steps {
                    script {
                        def y = new org.mygurukulam.common.Yaml()
                        y.lint(config.path)
                    }
                }
            }
        }
    }
}
