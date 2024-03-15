def call() {
    sh 'npm install'
    sh 'npm ci'
    sh 'echo "module.exports = { extends: \'eslint:recommended\' };" > .eslintrc.js'
    sh 'npx eslint . --ext .js,.jsx --format ${format} --output-file ${filename} || true'
}
