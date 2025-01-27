pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('Docker_Pass')  // Your Docker Hub credentials ID
        DOCKER_REPO_DEV = 'bubbly17/dev'
        DOCKER_REPO_PROD = 'bubbly17/prod'
    }
    stages {
        stage('Clone Repository') {
            steps {
                // SCM (Source Code Management) is configured in the Jenkins job
                // This will automatically use the branch from SCM
                git url: 'https://github.com/Pavithra-1726/devops-build.git', branch: '${BRANCH_NAME}'
            }
        }
        stage('Build Image') {
            steps {
                script {
                    // Build the Docker image using the build.sh script
                    sh './build.sh'  // Make sure this script builds and tags the Docker image as react-app:latest
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Push to Docker Hub based on the branch name
                    if (env.BRANCH_NAME == 'dev') {
                        // Tag the Docker image with 'dev' tag and push to Docker Hub 'dev' repo
                        sh "docker tag react-app:latest ${DOCKER_REPO_DEV}:latest"
                        
                        // Login to Docker Hub using Jenkins credentials
                        withCredentials([usernamePassword(credentialsId: 'Docker_pass', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                            sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                        }
                        
                        // Push the Docker image to the 'dev' repository
                        sh "docker push ${DOCKER_REPO_DEV}:latest"
                    } else if (env.BRANCH_NAME == 'main') {
                        // Tag the Docker image with 'prod' tag and push to Docker Hub 'prod' repo
                        sh "docker tag react-app:latest ${DOCKER_REPO_PROD}:latest"
                        
                        // Login to Docker Hub using Jenkins credentials
                        withCredentials([usernamePassword(credentialsId: 'Docker_pass', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                            sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                        }
                        
                        // Push the Docker image to the 'prod' repository
                        sh "docker push ${DOCKER_REPO_PROD}:latest"
                    }
                }
            }
        }
    }
}
