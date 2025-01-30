pipeline {
    agent any

    parameters {
        choice(name: 'BRANCH_NAME', choices: ['dev', 'main'], description: 'Choose the branch to deploy')
    }
	
	environment {
        DOCKER_DEV_REPO = "bubbly17/dev"
        DOCKER_PROD_REPO = "bubbly17/prod"
	IMAGE_NAME = "myimage" // Define IMAGE_NAME here
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
                // Run your build.sh script to build and tag the Docker image
               bat 'docker build -t ${DOCKER_DEV_REPO}:${IMAGE_TAG} .'
            }
        }
	     
	  stage('Push to Docker Hub (Dev)') {
    steps {
        script {
            def branchName = env.GIT_BRANCH.replaceAll(/^origin\//, '')  // Clean branch name
            
            // Check if the branch is 'dev' before pushing to Docker Hub
            if (branchName == 'dev') {
                echo "Pushing Docker image to Docker Hub - Dev"
                
                // Login to Docker Hub using the Docker credentials
                withCredentials([usernamePassword(credentialsId: 'Docker_pass', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh """
                        docker login -u \$DOCKER_USERNAME -p \$DOCKER_PASSWORD
                        docker image ${DOCKER_DEV_REPO}:${IMAGE_TAG} push
                    """
                }
            }
        }
    }
}
    }
}
