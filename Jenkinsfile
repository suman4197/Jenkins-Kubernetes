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
        def mavenHome = tool name: 'maven-3.8.5', type: 'maven'
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean install"
      }
   }
}
            
            
