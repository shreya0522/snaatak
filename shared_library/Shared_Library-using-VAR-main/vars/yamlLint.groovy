// path = define path of your yaml file
def call(Map config = [:]) {
echo "Linting the YAML file ${config.path}";
       sh 'yamllint ${config.path}'
}
