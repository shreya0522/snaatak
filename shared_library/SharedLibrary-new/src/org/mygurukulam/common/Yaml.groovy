package org.mygurukulam.common

def lint(String path) {
    echo "Linting the YAML file ${path}";
    sh "yamllint ${path}"
}

return this