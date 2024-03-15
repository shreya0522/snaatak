def call()
{
    echo "Executing Golang Bug Analysis"
    environment {
        GO_VERSION = '1.20.2'
        GOROOT = '/usr/local/go'
        GOPATH = "$HOME/"
        PATH = "${GOPATH}/bin:${GOROOT}/bin:${env.PATH}"
    }
    
    sh '''
       sudo apt auto-remove golang-go -y
       sudo rm -rf ${GOROOT}
       wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz
       sudo tar -xvf go${GO_VERSION}.linux-amd64.tar.gz -C /usr/local
     '''
       // Set environment variables
    sh "export GOROOT=${GOROOT}"
    sh "export GOPATH=${GOPATH}"
    sh "export PATH=${PATH}"
       // Install golangci-lint
    sh 'go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest'
    sh 'sudo apt install nginx -y'
       // Run golangci-lint and copy the HTML report to Nginx directory
    sh '''
        echo "http://13.213.77.36/"
              rm *.html
              golangci-lint run --out-format html > builder-report.html || true
              sudo cp builder-report.html /var/www/html/index.nginx-debian.html
              rm *.gz*
           '''
}
