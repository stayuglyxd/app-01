#!groovy
// Run docker build
properties([disableConcurrentBuilds()])

pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
    }
    stages {
        stage("create docker image") {
            steps {
                echo "========== start building image =========="
                script {
                    def dockerImage = 'myapp:latest' // Измените на актуальное название вашего образа и тег
                    sh "docker build -t ${dockerImage} ."
                    sh "docker run -d -p 5000:5000 --name myapp_container ${dockerImage}"
                }
            }
        }
    }
}


