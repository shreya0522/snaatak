package org.mygurukulam.template

import org.mygurukulam.common.*
import org.mygurukulam.frontend.*


def call(String url, String cred, String branch, Map config = [:]) {

    def git = new org.mygurukulam.common.Checkout()
    def credScan = new org.mygurukulam.common.CredScanningNopath()
    def dc = new org.mygurukulam.common.DependencyCheck()
    def bug = new org.mygurukulam.frontend.BugAnalysis()
    def build = new org.mygurukulam.frontend.Build()
    def cleanup = new org.mygurukulam.common.Cleanup() 
    def ami = new org.mygurukulam.common.BuildAMIwithDir()
    def zip = new org.mygurukulam.common.Zip() 
    cleanup.call()
    git.call(url, cred, branch)
    credScan.call()
    //test.call()
    dc.call()
    bug.call() 
    build.call()
    zip.call("build")
    git.call(config.packerUrl, cred, branch)
    ami.call(config.packerFile, config.directory)
}
