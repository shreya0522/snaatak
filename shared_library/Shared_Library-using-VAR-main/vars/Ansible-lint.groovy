// path = define path of your main.yaml
def call(Map config = [:]) {
echo "Running ansible-lint on your main file ${config.path}";
       sh 'ansible-lint ${config.path}'
}
