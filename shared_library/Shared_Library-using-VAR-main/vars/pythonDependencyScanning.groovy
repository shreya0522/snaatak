def call()
{
    echo "Executing java test"
    sh '. myenv/bin/activate'
    sh 'safety check -r  pyproject.toml | tee safety_output.txt'
}
