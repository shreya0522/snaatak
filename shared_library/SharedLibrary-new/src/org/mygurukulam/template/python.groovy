package org.mygurukulam.template

import org.mygurukulam.common.*
import org.mygurukulam.python.*


def call(String url, String cred, String branch, Map config = [:]) {

    def git = new org.mygurukulam.common.Checkout()
    def credScan = new org.mygurukulam.common.CredScanningNopath()
    def dependencie = new org.mygurukulam.python.InstallDependencies()
    def analysis = new org.mygurukulam.python.StaticCodeAnalysis()
    def scanning = new org.mygurukulam.python.DependencyScanning()
    def test = new org.mygurukulam.python.UnitTest()
    def bug = new org.mygurukulam.python.BugAnalysis()
    //def ami = new org.mygurukulam.common.BuildAMI()
    def ami = new org.mygurukulam.common.BuildAMIwithDir()

    git.call(url, cred, branch)
    credScan.call()
    dependencie.call()
    analysis.call()
    scanning.call()
    test.call()
    bug.call()
    git.call(config.packerUrl, cred, branch)
    ami.call(config.packerFile, config.directory)

}