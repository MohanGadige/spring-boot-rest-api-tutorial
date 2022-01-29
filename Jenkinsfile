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
    stage("pushing helm charts to dockerhub"){
      steps{
        script{
          withCredentials([string(credentialsId: 'docker_pass1', variable: 'docker_password1')]) {
            sh '''
                   helmversion=$( helm show chart helm-sb | grep version | cut -d: -f 2 | tr -d ' ')
                   tar -czvf  helm-sb-${helmversion}.tgz helm-sb/
                   curl -u mohan0007:$docker_password1 https://index.docker.io/v1/repository/helm --upload-file helm-sb-${helmversion}.tgz -v
               '''   
          }
        }  
      }
    }  
  }
}  
