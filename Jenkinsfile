pipeline {
    agent any
    stages {
        stage ('Passing token') {
            steps {
                script{
                    def jsonFileString = readFile file: "${WORKSPACE}/token.json"
                    jsonFileString = jsonFileString.replaceAll("YOUR_TOKEN", params.token)
                    writeFile file: "${WORKSPACE}/token.json", text: jsonFileString
                }
            }
        }
        stage ('Dependencies Installation Stage') {
            steps {
                sh 'gem install bundler:2.3.17'
                sh 'bundle install'
            }
        }
        stage ('Testing Stage') {
            steps {
                sh 'bundle exec cucumber'
            }
        }
        stage ('Allure report Stage') {
            steps {
                allure includeProperties: false,
                    jdk: '',
                    results: [[path: 'allure-results']]
            }
        }
    }
}