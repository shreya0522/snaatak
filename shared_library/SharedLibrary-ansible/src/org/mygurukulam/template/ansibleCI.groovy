package org.mygurukulam.template

import org.mygurukulam.common.*
import org.mygurukulam.ansible.*

def checkout( String url ,String branch , Map config = [:] ) {
   def git = new org.mygurukulam.common.Checkout()
    git.call(url , branch , creds)
}

def playrun(String inventoryPath, String testPlaybookPath, String ssh_pem , Map config = [:]) { 
   def play = new org.mygurukulam.ansible.Playbook()
   play.runAnsiblePlaybook(inventoryPath, testPlaybookPath, ssh_pem)
}


