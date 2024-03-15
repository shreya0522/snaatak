def call() {
  echo "Golang code compilation"
   sh 'go install'  
   sh "go list -f '{{.Target}}'"
  }
