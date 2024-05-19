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
                dir ('./') { // Это тоже самое, что и не указывать директорию вообще
                    sh 'docker build .'
                }
            }
        }
    }
}

