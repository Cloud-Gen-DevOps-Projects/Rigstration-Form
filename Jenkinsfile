pipeline{
	agent any 
	tools{
		jdk 'jdk17'
		
	}
	environment{
		SCANNER_HOME=tool 'sonar-token'
	}
	stages{
		stage('clean workspace'){
			steps{
				cleanWs()
			}
		}
		stage('Code Checkout From Git'){
			steps{
				git branch: 'main', url: 'https://github.com/Cloud-Gen-DevOps-Projects/Rigstration-Form.git'
			}
		}
		stage("SonarQube Code Analysis"){
			steps{
				withSonarQubeEnv('sonar-token'){
					sh 'mvn clean sonar:sonar'
				}
			}
		}
		stage("Code Quality Gates"){
			steps{
				script{
					 timeout(time: 2, unit: 'MINUTES'){
					waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token'
				}
			}
		}
	}
		stage("Package Build"){
			steps{
				sh 'mvn clean package'
			}
		}

	stage("War Deploy to JBoss Server"){
			steps{
				sh 'scp ./webapp/target/register-form.war root@192.168.254.165:/opt/wildfly/standalone/deployments'
			}
		}
	}
}
