pipeline {
  agent any
    stages {
      stage ('cloning a repository') {
         steps {
           git branch: 'main', url: 'https://github.com/suman4197/Jenkins-Kubernetes.git'
           echo "cloning is successful"
         }
      }
      stage ('building a source code') {
          steps {
              script {
            def mavenHome = tool name: "maven-3.8.5", type: "maven"
            def mavenCMD = "${mavenHome}/bin/mvn"
            sh "${mavenCMD} clean install"
              }
          }
      }
      stage ('Building a Docker Image') {
          steps {
              sh 'docker build -t suman4197/custom-image:1.0 .'
          }
      }
      stage ('login and Push image to Hub') {
          steps {
           withCredentials([string(credentialsId: 'Docker_Hub_Credentials', variable: 'Docker_Hub_Credentials')]) {
            sh 'docker login -u suman4197 -p ${Docker_Hub_Credentials}'   
            } 
            sh 'docker push suman4197/custom-image:1.0'
            echo "pushing the image to the hub is successful"
          }
        }
      stage ('deploying to the K8s') {
          steps {
              kubernetesDeploy( configs: 'Kubernetes.yml', kubeconfigId: 'Kubernetes_Credentials', enableConfigSubstitution: true )
            }
        }
      }
   }
            
            
