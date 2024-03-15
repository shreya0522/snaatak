package org.mygurukulam.template

import org.mygurukulam.common.*
import org.mygurukulam.ansible.*


def call(String url, String creds, String branch, String path) {

    def git = new org.mygurukulam.common.Checkout()
    def credScan = new org.mygurukulam.ansible.GitLeaks()
    def ansibleLint = new org.mygurukulam.ansible.AnsibleLint()
    def syntaxCheck = new org.mygurukulam.ansible.AnsibleSyntaxCheck()
    def dryRun = new org.mygurukulam.ansible.DryRun()
    def yamlLint = new org.mygurukulam.ansible.YamlLint()
    def cleanup = new org.mygurukulam.common.Cleanup()

    cleanup.call()
    git.call(url, creds, branch)
    credScan.call(path)
    ansibleLint.call(path)
    syntaxCheck.call(path)
    dryRun.call(path)
    yamlLint.call(path)
}
