pipeline
{
	agent any
	tools
	{
	maven "maven"
	}
	stages{
		stage('Code Checkout'){
			steps{
				git branch: 'main', url: 'https://github.com/Devops9AM/Rigstration-Form.git'
			}
		}
		stage('Cleaning The Old Artifact'){
			steps{
				sh 'mvn clean'
			}
		}
		stage('Installing Plugins'){
			steps{
				sh 'mvn install'
			}
		}
		stage('Code Validtating'){
			steps{
				sh 'mvn validate'
			}
		}

		stage('Code Test'){
			steps{
				sh 'mvn test'
			}
		}
		stage('Code Compiling'){
			steps{
				sh 'mvn compile'
			}
		}
		stage("SonarQube Code analysis") {
            		steps {
              			withSonarQubeEnv('CodeQuality') {
                		sh 'mvn sonar:sonar'
              			}
            		}
          	}
		stage('Artifacting the Packge'){
			steps{
				sh 'mvn package'
			}
		}
		stage('War Deploy into Nexus'){
			steps{
				sh 'mvn deploy'
			}
		}
		stage('Ownership') {
		       steps {
        		sh "chmod +x -R ${env.WORKSPACE}"

 			   }
		}
		stage('Deploy War into Tomcat'){
		    steps{
		       sshagent(['Tomcat-Web-Server']) {
	            	sh 'scp /root/.jenkins/workspace/Registration-Form-1/webapp/target/*.war root@192.168.10.165:/opt/tomcat/webapps' 
	            	}
		    }
		}
		stage('mailing the status on this job'){
			steps{
			    mail bcc: '', body: '''Hi We are from Project Build Team. Pls have a look on this project output.
				''', cc: '', from: '', replyTo: '', subject: 'Jenkins Pipeline Job Execution', to: 'cloudgen0323@gmail.com'
				}
		}

	}
}
