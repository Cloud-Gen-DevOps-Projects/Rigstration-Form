pipeline{
	agent any 
	tools{
		jdk 'jdk17'
		maven 'maven'
		
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
		stage ('Change File Ownership'){
			steps{
				sh 'ssh root@192.168.254.165 "chown wildfly:wildfly /opt/wildfly/standalone/deployments/register-form.war"'
				}
			}
		

	}
}
