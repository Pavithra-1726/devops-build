pipeline {
    agent any
    environment {
        DOCKER_IMAGE_NAME = 'paviimage1'
        DOCKERHUB_USERNAME = 'bubbly17'
        DOCKERHUB_CREDENTIALS_ID = 'Docker_pass'
        DOCKER_REPO = 'prod'  
    }
    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/Pavithra-1726/devops-build.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKERHUB_USERNAME}/${DOCKER_REPO}:${DOCKER_IMAGE_NAME}")
                }
            }
        }
        stage('Push to Docker Hub - prod') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS_ID) {
                        docker.image("${DOCKERHUB_USERNAME}/${DOCKER_REPO}:${DOCKER_IMAGE_NAME}").push("prod")	
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs()  
        }
    }
}
