package org.mygurukulam.template

import org.mygurukulam.common.*
import org.mygurukulam.Golang.*


def call(String url, String cred, String branch, Map config = [:]) {

    def cleanup = new org.mygurukulam.common.Cleanup()
    def git = new org.mygurukulam.common.Checkout()
    def credScan = new org.mygurukulam.common.CredScanningNopath()
    // def compile = new org.mygurukulam.Golang.compilation()
    def install  = new org.mygurukulam.Golang.Install()
    def build  = new org.mygurukulam.Golang.Build()
    //def analysis = new org.mygurukulam.Golang.StaticcodeAnalysis()
    // def scanning = new org.mygurukulam.Golang.DependencyCheck()
    // def test = new org.mygurukulam.Golang.UnitTest()
    //def bug = new org.mygurukulam.Golang.BugAnalysis()
    def ami = new org.mygurukulam.common.BuildAMIwithDir()

    cleanup.call()
    git.call(url, cred, branch)
    credScan.call()
    install.call()
    build.call()
    //bug.call()
    // compile.call()
    //analysis.call()
    // scanning.call()
    // test.call()
    git.call(config.packerUrl, cred, branch)
    ami.call(config.packerFile, config.directory)
}
