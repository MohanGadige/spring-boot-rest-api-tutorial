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
               ...
          }
        }  
      }
    }
  }
} 
