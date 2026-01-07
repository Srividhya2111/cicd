pipeline {
    agent any

    environment {
        IMAGE_NAME = "srividhyanalla/foodtruck-app"
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/Srividhya2111/cicd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t foodtruck-app .'
            }
        }

        stage('Tag Docker Image') {
            steps {
                bat 'docker tag foodtruck-app %IMAGE_NAME%'
            }
        }

        stage('Login to DockerHub') {
            steps {
                bat '''
                echo %DOCKERHUB_CREDENTIALS_PSW% | docker login -u %DOCKERHUB_CREDENTIALS_USR% --password-stdin
                '''
            }
        }

        stage('Push to DockerHub') {
            steps {
                bat 'docker push %IMAGE_NAME%'
            }
        }

        stage('Run Container') {
            steps {
                bat '''
                docker stop foodtruck || echo "No container running"
                docker rm foodtruck || echo "No container to remove"
                docker run -d -p 8081:80 --name foodtruck %IMAGE_NAME%
                '''
            }
        }

    }
}
