pipeline {
    agent any

    parameters {
        choice(name: 'BRANCH_NAME', choices: ['dev', 'main'], description: 'Choose the branch to deploy')
    }

    environment {
        DOCKER_DEV_REPO = "bubbly17/dev"
        DOCKER_PROD_REPO = "bubbly17/prod"
        IMAGE_TAG = "latest"
		DOCKERHUB_CREDENTIALS_ID = 'Docker_pass'
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Checkout the selected branch (dev or main)
                    git branch: "${params.BRANCH_NAME}", url: 'https://github.com/Pavithra-1726/devops-build'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh './build.sh'
            }
        }


    post {
        success {
            echo "Build is Successful! 🎉"
        }
        failure {
            echo "Build is Failed! 🚨"
        }
    }
}
}
