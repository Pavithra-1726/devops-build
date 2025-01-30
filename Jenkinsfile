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
               bat 'docker build -t myimage .'
            }
        }
	     
	  stage('Push to Docker Hub (Dev)') {
            steps {
                script {
                    def branchName = env.GIT_BRANCH.replaceAll(/^origin\//, '')  // Remove 'origin/' if it's present
                    if (branchName == 'dev') {
                        echo "Pushing to Docker Hub - Dev"
                        // Push the Docker image to the 'dev' repo on Docker Hub
                        docker.withRegistry('https://index.docker.io/v1/', Docker_pass) {
                            docker.image(IMAGE_NAME).push('dev')
                        }
		    }
		}
             }
         }
    }
}
