def call(Map config = [:]) {
    pipeline {
        agent any

        parameters {
            booleanParam(name: 'SKIP_FILE_ZIP', defaultValue: false, description: 'Skip file zip stage')
            booleanParam(name: 'SKIP_DEPENDENCY_CHECK', defaultValue: false, description: 'Skip dependency-check stage')
            booleanParam(name: 'SKIP_BUILD', defaultValue: false, description: 'Skip build stage')
            booleanParam(name: 'SKIP_INSTALL_DEPENDENCY', defaultValue: false, description: 'Skip dependency installation')
            booleanParam(name: 'SKIP_CREDENTIAL_SCANNING', defaultValue: false, description: 'Skip credential scanning stage')
            string(name: 'VERSION', defaultValue: '1.0', description: 'Enter application version')
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

            stage('Install dependency') {
                when {
                    expression { params.SKIP_INSTALL_DEPENDENCY == false }
                }
                steps {
                    script {
                        def d = new org.mygurukulam.frontend.Dependency()
                        d.install()
                    }
                }
            }


            stage('Dependency check') {
            
                when {
                    expression { params.SKIP_DEPENDENCY_CHECK == false }
                }
            
                steps {
                    script {
                        def d = new org.mygurukulam.common.Dependency()
                        d.check(config.project)
                    }
                }
            }

            stage('Build') {
                when {
                    expression { params.SKIP_BUILD == false }
                }
                steps {
                    script {
                        def b = new org.mygurukulam.frontend.Build()
                        b.build()
                    }
                }
            }

            stage('Zip files') {
                when {
                    expression { params.SKIP_FILE_ZIP == false }
                }
                steps {
                    script {
                        def z = new org.mygurukulam.common.Zip()
                        z.zip("build")
                    }
                }
            }

            stage('Clone Packer configuration') {
                steps {
                    script {
                        def checkout = new org.mygurukulam.common.Checkout()
                        checkout.clone(config.packerUrl, config.creds, config.branch)
                    }
                }
            }

            stage("Build ami") {
                steps {
                    script {
                        def ami = new org.mygurukulam.common.BuildAMI()
                        ami.build(config.packerFile)        
                    }
                }
            }
        }
    }
}
