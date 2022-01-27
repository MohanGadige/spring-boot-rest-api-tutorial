pipeline {
  agent any
  
  stages{
    stage("docker build & docker push"){
      steps{
        script{
          withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_password')]) {
            sh '''
                docker build -t 35.175.138.38:8083/sb .
                docker login -u admin -p $docker_password 35.175.138.38:8083
                docker push 35.175.138.38:8083/sb
               '''
          }
        }  
      }
    }
  }
  
  post {
		always {
			mail bcc: '', body: "<br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "${currentBuild.result} CI: Project name -> ${env.JOB_NAME}", to: "mohangadige7@gmail.com";  
		}
	}    
} 
