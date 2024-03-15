package org.mygurukulam.template

import org.mygurukulam.common.*
import org.mygurukulam.terraform.*


def call(String url, String cred, String branch, String rootPath, String childPath) {

    def git = new org.mygurukulam.common.Checkout()
    def deploy = new org.mygurukulam.terraform.Deploy()
    def tf = new org.mygurukulam.terraform.Action()
    def cleanup = new org.mygurukulam.common.Cleanup()

    cleanup.call()
    git.call(url, cred, branch)
    tf.call(rootPath, childPath, "init")
    deploy.call(rootPath, childPath)
}
