package org.mygurukulam.ansible

def runAnsiblePlaybook(String inventoryPath, String testPlaybookPath , String ssh_pem) {
    echo "Running Ansible playbook"
    sh """
        ansible-playbook -i ${WORKSPACE}/"${inventoryPath}" \
        --private-key=${ssh_pem} \
        ${WORKSPACE}/"${testPlaybookPath}"
    """
}


