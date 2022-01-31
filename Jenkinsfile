pipeline {
  agent any  
  stages{
    stage("docker build & docker push") {
      steps {
        script {
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
    stage("deploying application to k8s cluster") {
      steps {
        script {
          kubernetesDeploy configs: 'deploymentservice.yml', kubeConfig: [path: '/root/kube/config'], kubeconfigId: 'k8s-config', serverUrl: 'https://192.168.49.2:8443']
        }
      }
    }
  }
}
  
