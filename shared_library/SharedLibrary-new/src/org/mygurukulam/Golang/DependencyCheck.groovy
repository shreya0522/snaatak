package org.mygurukulam.Golang

def call() {
    pipeline {
        agent any
        stages {
            stage('Code Checkout') {
                steps {
                    script {
                        git branch: 'main', url: 'https://github.com/OT-MyGurukulam/employee-api.git'
                    }
                }
            } 
            stage('Installing Dep Tool Nancy') {
                steps {
                    script {
                        sh '''
                            // Remove if any existing old file of nancy 
                            sudo rm -rf nancy
                            // Clone the tool to the workspace
                            git clone https://github.com/sonatype-nexus-community/nancy.git  
                            // Compiling the tool
                            cd nancy
                            go get ./...
                            go build -o nancy .  
                        '''
                    }
                }
            }
            stage('Run Dependency Analysis') {
                steps {
                    script {
                        sh '''
                            // Removing if any existing files in the folder
                            rm nancy_scan_results.txt || true
                            // Export the path of Nancy 
                            export PATH=$PATH:${WORKSPACE}/nancy
                            // Creating the report in text format
                            go list -json -deps ./... | nancy sleuth > nancy_scan_results.txt || true  
                            cat nancy_scan_results.txt  
                        '''
                    }
                }
            }
        }
    }
}
return this
