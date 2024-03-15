def call(){
    echo "Executing bug analysis"
    sh 'mvn spotbugs:spotbugs'
    sh 'mvn site'
}