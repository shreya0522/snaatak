package org.mygurukulam.common

def call(String url , String branch , String creds) {
           echo "Cloning repo ${url} from branch ${branch} using creds ${creds}";
            git branch: "${branch}", credentialsId: "${creds}", url: "${url}"
    }
