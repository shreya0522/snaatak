def call()
{
    echo "Executing java test"
    sh 'python3 -m venv myenv'
    sh '. myenv/bin/activate'
    sh 'python3 -m pip install -r requirements.txt'
    sh 'python3 -m pip install flake8-html'
    sh 'sudo pip install pylint'
    sh 'sudo pip install bandit'
    sh 'sudo pip install pytest'
    sh 'sudo pip install safety'
}
