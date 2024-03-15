def call(Map config = [:]) {
    pipeline {
        agent any
        environment {
            PATH = "/var/lib/jenkins/.local/bin:$PATH"
        }

        parameters {
            string(name: 'ARTIFACT_VERSION', defaultValue: '1.0', description: 'Terraform artifact version')
            string(name: 'ROOT_DIR', defaultValue: 'Prod', description: 'Root directory')
            string(name: 'CHILD_DIR', defaultValue: 'Network', description: 'Root directory')
        }

        stages {
            
            stage("Checkout") {
                steps {
                    script {
                        def checkout = new org.mygurukulam.common.Checkout()
                        checkout.clone(config.url, config.creds, config.branch)
                    }
                }
            }

            stage('CredScanning') {
                steps {
                    script {
                        dir("${ROOT_DIR}/${CHILD_DIR}") {
                            def tfsharedlib = new org.mygurukulam.common.CredentialScanning()
                            tfsharedlib.scane()
                        }
                    }
                }
            }

            stage('Terraform Init') {
                steps {
                    script {
                        dir("${ROOT_DIR}/${CHILD_DIR}") {
                            def tfsharedlib = new org.mygurukulam.terraform.TFsharedLib()
                            tfsharedlib.terraform('init')
                        }
                    }
                }
            }

            stage('Terraform Validate') {
                steps {
                    script {
                        dir("${ROOT_DIR}/${CHILD_DIR}") {
                            def tfsharedlib = new org.mygurukulam.terraform.TFsharedLib()
                            tfsharedlib.terraform('validate')
                        }
                    }
                }
            }

            stage('Static Code Analysis') {
                steps {
                    script {
                        dir("${ROOT_DIR}/${CHILD_DIR}") {
                            def tfsharedlib = new org.mygurukulam.terraform.TFsharedLib()
                            tfsharedlib.linting()
                        }
                    }
                }
            }

            stage('Security/Compliance') {
                steps {
                    script {
                        dir("${ROOT_DIR}/${CHILD_DIR}") {
                            def tfsharedlib = new org.mygurukulam.terraform.TFsharedLib()
                            tfsharedlib.security()
                        }
                    }
                }
            }

            stage('Infra Cost') {
                steps {
                    withCredentials([string(credentialsId: 'INFRACOST_API_KEY', variable: 'INFRACOST_API_KEY')]){
                        script {
                            dir("${ROOT_DIR}/${CHILD_DIR}") {
                                def tfsharedlibrary = new org.mygurukulam.terraform.TFsharedLib()
                                tfsharedlibrary.infracost()
                            }
                        }
                    }
                }
            }

            stage('Terraform plan') {
                steps {
                    script {
                        dir("${ROOT_DIR}/${CHILD_DIR}") {
                            def tfsharedlib = new org.mygurukulam.terraform.TFsharedLib()
                            tfsharedlib.terraform('plan')
                        }
                    }
                }
            }

            stage('Artifact release') {
                steps {
                    withCredentials([gitUsernamePassword(credentialsId: 'dnishad004', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        script {
                            sh "git tag -a ${ARTIFACT_VERSION} -m 'Release ${ARTIFACT_VERSION}'"
                            sh "git push origin refs/tags/${ARTIFACT_VERSION}"
                        }
                    }
                }
            }
        }

        post {
            always {
                deleteDir()
            }
        }
    }
}
