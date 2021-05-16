pipeline {
    agent any
	
    tools {
    maven 'maven3'
}
    environment {
     DOCKER_IMAGE='yourImageName:tagName'
}

stages {
	stage('checkout from github') {
	steps{
	checkout scm
	}
	}
	stage('Package') {
         	steps{
	bat 'set +e mvn clean package -DskipTest'
	}
	}
	stage('create Docker Image') {
	steps{
		script {
		docker_image=docker.build("${env.DOCKER_IMAGE}",'-f ./Dockerfile.')
		}
    	}
	}	
 
        stage('Run application container') {
            steps {
                sh "docker run -d -p 8888:8080 --name myAapp ${DOCKER_IMAGE}"
            }
        }
    }
}
