def call(Map config = [:]) {
    echo "Cloning repo ${config.url} from branch ${config.branch} using creds ${config.creds}";
        git branch: "${config.branch}", credentialsId: "${config.creds}", url: "${config.url}"
}
