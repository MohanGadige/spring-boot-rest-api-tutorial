pipeline {
  agent any
  
  stages{
    stage("docker build & docker push"){
      steps{
        script{
          withCredentials([string(credentialsId: 'docker_pass1', variable: 'docker_password1')]) {
            sh '''
                docker build -t mohan0007/sb .
                docker login -u mohan0007 -p $docker_password1 
                docker push mohan0007/sb
               '''
          }
        }  
      }
    }
  }   
} 
