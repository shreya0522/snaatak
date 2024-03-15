package org.mygurukulam.ansible
def runAnsiblePlaybook(String inventoryPath, String testPlaybookPath) {
    echo "Running Ansible playbook"
    sh """
        ansible-playbook -i ${WORKSPACE}/"${inventoryPath}" \
        ${WORKSPACE}/"${testPlaybookPath}"
    """
}
