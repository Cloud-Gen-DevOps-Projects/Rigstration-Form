pipeline{
	agent any
	tools {
		maven 'maven'
	}
	environment{
		SCANNER_HOME=tool 'sonar'
	}
	stages{
		stage("Code Check Out"){
			steps{
				git branch: 'main', url: 'https://github.com/Cloud-Gen-DevOps-Projects/Rigstration-Form.git'
				}
			}
		stage("Clean Artifact"){
			steps{
				sh 'mvn clean'
			}
		}
		stage("Code Quality Check"){
			steps{
				withSonarQubeEnv('sonar'){
					sh 'mvn clean sonar:sonar'
				}
			}
		}

		stage("Package Build"){
			steps{
				sh 'mvn package'
			}
		}
		stage("Artifact Deploy to Nexus"){
			steps{
				sh 'mvn deploy'
				
			}
			}
		

	}

}
