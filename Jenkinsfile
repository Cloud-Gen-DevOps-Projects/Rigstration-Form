pipeline {
	agent any 
	tools{
		maven "maven3"
		jdk "jdk17"
	}
	environment{
		SCANNER_HOME = tool 'sonar-token'
	}
	stages{
		stage("Code Checkout"){
			steps{
				git branch: 'main', url: 'https://github.com/Cloud-Gen-DevOps-Projects/Rigstration-Form.git'
			}
		}
		stage("Code Qulity Check"){
			steps{
				withSonarQubeEnv('sonar-token') {
					sh "mvn clean install sonar:sonar"

					}
			}
		}
		stage("Package Build"){
			steps{
				sh "mvn package"
			}
		}
		stage("Package Deploy"){
			steps{
				sh "mvn deploy"
			}
		}
		stage("Docker Image Build"){
			steps{
				sh "docker build -t cloudgen01/registration-form:latest ."
			}
		}
		stage("Docker Image Upload into Docker Registry"){
			steps{
				withDockerRegistry(credentialsId: 'Docker-Cloudgen01', url: 'https://index.docker.io/v1/') {
    			sh "docker push cloudgen01/registration-form:latest"
				}
			}
		}



	}
	post {
    always {
        script {
            // Get job name, build number, and pipeline status
            def jobName = env.JOB_NAME
            def buildNumber = env.BUILD_NUMBER
            def pipelineStatus = currentBuild.result ?: 'UNKNOWN'
            pipelineStatus = pipelineStatus.toUpperCase()
            
            // Set the banner color based on the status
            def bannerColor = pipelineStatus == 'SUCCESS' ? 'green' : 'red'

            // HTML body for the email
            def body = """
            <body>
                <div style="border: 2px solid ${bannerColor}; padding: 10px;">
                    <h3 style="color: ${bannerColor};">
                        Pipeline Status: ${pipelineStatus}
                    </h3>
                    <p>Job: ${jobName}</p>
                    <p>Build Number: ${buildNumber}</p>
                    <p>Status: ${pipelineStatus}</p>
                </div>
            </body>
            """

            // Send email notification
            emailext(
                subject: "${jobName} - Build ${buildNumber} - ${pipelineStatus}",
                body: body,
                to: 'ravindra.devops@gmail.com',
                from: 'ravindra.devops@gmail.com',
                replyTo: 'ravindra.devops@gmail.com',
                mimeType: 'text/html'
            )
        }
    }
}
}

