pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = 'bubbly17'
        IMAGE_NAME = 'react-app'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'dev', url: 'https://github.com/Pavithra-1726/devops-build.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'Docker_pass', url: '']) {
                    script {
                        if (env.BRANCH_NAME == 'dev') {
                            sh 'docker tag $IMAGE_NAME $DOCKER_HUB_USERNAME/dev:$IMAGE_NAME'
                            sh 'docker push $DOCKER_HUB_USERNAME/dev:$IMAGE_NAME'
                        } else if (env.BRANCH_NAME == 'main') {
                            sh 'docker tag $IMAGE_NAME $DOCKER_HUB_USERNAME/prod:$IMAGE_NAME'
                            sh 'docker push $DOCKER_HUB_USERNAME/prod:$IMAGE_NAME'
                        }
                    }
                }
            }
        }
    }
}
