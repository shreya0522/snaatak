package org.mygurukulam.ansible

def call(String path) {
    stage('Yaml lint') {
        script {
                echo "Linting the YAML file ${path}";
                sh "yamllint ${path}"
        }
    }
}
