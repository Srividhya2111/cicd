pipeline {
    agent any

    environment {
        IMAGE_NAME = "foodtruck-app"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Srividhya2111/cicd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    docker.image("${IMAGE_NAME}").run('-p 5000:5000')
                }
            }
        }
    }
}
