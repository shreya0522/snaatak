// path = define path of your main.yaml
def call(Map config = [:]) {
echo "Checking the syntax of your ansible role";
sh 'ansible-playbook ${config.path} --syntax-check'
}
