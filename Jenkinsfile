pipeline {
    environment {
        // Задайте имя образа
        DOCKER_IMAGE_NAME = 'nginx'
        // Задайте тег для образа
        DOCKER_IMAGE_TAG = 'latest'
    }

    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Сборка Docker образа
                    docker.build("${env.DOCKER_IMAGE_NAME}:${env.DOCKER_IMAGE_TAG}")
                }
            }
        }

        stage('Run Nginx Container') {
            steps {
                script {
                    // Запуск контейнера для тестирования
                    docker.image("${env.DOCKER_IMAGE_NAME}:${env.DOCKER_IMAGE_TAG}").run("-p 8080:80")
                }
            }
        }

        stage('Test Nginx Container') {
            steps {
                // Используйте curl или другой инструмент для тестирования работоспособности Nginx
                script {
                    def response = sh(script: "curl -I localhost:8080 | grep '200 OK'", returnStdout: true).trim()
                    assert response == 'HTTP/1.1 200 OK'
                }
            }
        }
    }
    
    post {
        always {
            // Остановка и удаление контейнеров и образов после тестирования
            script {
                docker.image("${env.DOCKER_IMAGE_NAME}:${env.DOCKER_IMAGE_TAG}").stop()
                docker.image("${env.DOCKER_IMAGE_NAME}:${env.DOCKER_IMAGE_TAG}").remove(force: true)
            }
        }
    }
}


