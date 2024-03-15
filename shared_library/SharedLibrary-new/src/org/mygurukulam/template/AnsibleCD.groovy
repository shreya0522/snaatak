package org.mygurukulam.template

import org.mygurukulam.common.*
import org.mygurukulam.ansible.*


def call(String url, String creds, String branch) {

    def git = new org.mygurukulam.common.Checkout()
    def ansible = new org.mygurukulam.ansible.Play()
    def cleanup = new org.mygurukulam.common.Cleanup()

    cleanup.call()
    git.call(url, creds, branch)
    ansible.call()
}
