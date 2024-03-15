def call(Map config = [:]){
    echo "Executing dependency scanning for ${config.project} in directory ${config.scan} using tool ${config.tool}"
    dependencyCheck additionalArguments: "--project ${config.project} --scan ${config.scan} --format HTML", odcInstallation: "${config.tool}"
}