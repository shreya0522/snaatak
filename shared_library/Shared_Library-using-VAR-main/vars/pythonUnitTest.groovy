def call()
{
    echo "Executing Python test"
    sh '. myenv/bin/activate'
    sh 'pytest | tee pytest_output.txt'
}
