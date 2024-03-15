package org.mygurukulam.template

import org.mygurukulam.common.*
import org.mygurukulam.java.*


def call(String url, String cred, String branch, Map config = [:]) {

    def git = new org.mygurukulam.common.Checkout()
    def credScan = new org.mygurukulam.common.CredScanningNopath()
    def compile = new org.mygurukulam.java.MavenCompile()
    def test = new org.mygurukulam.java.MavenTest()
    def dc = new org.mygurukulam.common.DependencyCheck()
    def bug = new org.mygurukulam.java.Bug()
    def cleanup = new org.mygurukulam.common.Cleanup()
    def updateVersion = new org.mygurukulam.java.Update()
    def ami = new org.mygurukulam.common.BuildAMI()

    cleanup.call()
    git.call(url, cred, branch)
    credScan.call()
    test.call()
    // dc.call("salary")
    bug.call()
    git.call(config.packerUrl, cred, branch)
    updateVersion.call(config.version, config.packerFile)
    ami.call(config.packerFile)

}