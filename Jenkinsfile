pipeline {
    agent any

    

    stages {  
        
        stage('Git') {
            steps {
                git credentialsId: 'wardahsana', url: 'https://github.com/wardahsana/capstoneprojectudacity.git'
        
      }
    }           
      
        
        stage('Install dependencies') {
              steps {
                  echo "Installing dependencies"
                  
                  sh 'sudo npm install -g npm@latest'
                  sh 'sudo npm install react'
                  

                  

            }      
                
        }              
        stage('Build Application') {
              steps {
                  echo "Building app"
                  sh 'npm run build'
            }      
                
        }
         
        
        stage('Lint Application') {
              steps {
                  echo "Linting app"
                  sh 'npm run lint'
            }
        }    

        stage('Docker build image') {  
            steps {
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]) {
                    sh '''#!/bin/bash
                        sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                        sudo docker build -t capstone:latest .
                        sudo docker tag capstone:latest wardahsana/capstone:latest
                        sudo docker push wardahsana/capstone:latest
                        
                    '''  
                }
            }
        }
              
              
              
              
                    
        stage('Create kube config file') {
            steps {
                withAWS(region: 'us-east-2', credentials: 'aws-access-id') {
                    sh 'aws eks --region us-east-2 update-kubeconfig --name capstone'
                    }
                }       
            }

        stage('Deploy container to AWS EKS cluster') {
          steps {
              withAWS(region: 'us-east-2', credentials: 'aws-access-id') 
              sh 'kubectl set image deployment/capston-deployment capston-pod-reactapp=wardahsana/capstone:latest'

          
            }
          }
       }
}
