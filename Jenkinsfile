pipeline {
    agent any
    stages {

        stage('Install any dependencies') { 
            steps {
                echo "Installing dependencies"
                sh 'npm i' 
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
                  echo 'Building docker container'
                  sh 'docker build -t wardahsana/capproj .'
                  }
              }
        

        stage('Push image') {
              steps {
                  echo "Pushing image to DockerHub"
                  sh 'docker push wardahsana/capproj'
                  }
                }
                    

        stage('Deploy container to AWS EKS cluster') {
          steps {
              sh 'kubectl set image deployment/capston-deployment capston-pod-reactapp=wardahsana/capproj:latest'

          
            }
          }
       }

    }
