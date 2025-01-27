pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('Docker_Pass') // Replace with your Docker Hub credentials ID
        DOCKER_REPO_DEV = 'bubbly17/dev'
        DOCKER_REPO_PROD = 'bubbly17/prod'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: '${BRANCH_NAME}', url: 'https://github.com/Pavithra-1726/devops-build.git'
            }
        }
        stage('Build Image') {
            steps {
                script {
                    sh './build.sh'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh "docker tag react-app:latest ${DOCKER_REPO_DEV}:latest"
                        sh "echo ${DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${DOCKER_HUB_CREDENTIALS_USR} --password-stdin"
                        sh "docker push ${DOCKER_REPO_DEV}:latest"
                    } else if (env.BRANCH_NAME == 'master') {
                        sh "docker tag react-app:latest ${DOCKER_REPO_PROD}:latest"
                        sh "echo ${DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${DOCKER_HUB_CREDENTIALS_USR} --password-stdin"
                        sh "docker push ${DOCKER_REPO_PROD}:latest"
                    }
                }
            }
        }
    }
    post {
        always {
            echo "Pipeline completed!"
        }
    }
}
