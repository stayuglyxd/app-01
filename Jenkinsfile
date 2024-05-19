pipeline {
    environment {
        DOCKER_IMAGE = 'my-app-image:latest'
    }
    agent any
    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/stayuglyxd/app-01.git'
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Run Docker container') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).run("-p 8080:8080")
                }
            }
        }
    }
}

