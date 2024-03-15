// path = define path of your main.yaml
def call(Map config = [:]) {
echo "Checking your ansible role";
sh 'ansible-playbook ${config.path} --check'
}
