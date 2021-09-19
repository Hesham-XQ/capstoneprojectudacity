pipeline {
    agent any

    

    stages  
        stage('clone') { 
            git branch: 'master',
                url: 'https://github.com/wardahsana/capstoneprojectudacity.git'
}

        
        stage('Git') {
            steps {
                git credentialsId: 'wardahsana', url: 'https://github.com/wardahsana/capstoneprojectudacity.git'
        
      }
    }      
        
        
        

        stage('Install dependencies') {
              steps {
                  echo "Installing dependencies"
                  sh 'curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -'
                  sh 'sudo npm install -g npm@latest'
                  sh 'sudo npm install -g react-scripts'

                  

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
                  sh 'hadolint Dockerfile'
            }
        }    

        stage('Docker build image') {  
              steps {
                  echo 'Building docker container'
                  sh 'docker build -t wardahsana/capsproj .'
                  }
              }
        

        stage('Push image') {
              steps {
                  echo "Pushing image to DockerHub"
                  sh 'docker push wardahsana/capsproj'
                  }
                }
                    
        stage('Create kube config file') {
            steps {
                withAWS(region: 'us-east-2', credentials: 'aws-access-id') {
                    sh 'aws eks --region us-east-2 update-kubeconfig --name capsproj'
                    }
                }       
            }

        stage('Deploy container to AWS EKS cluster') {
          steps {
              withAWS(region: 'us-east-2', credentials: 'aws-access-id') 
              sh 'kubectl set image deployment/capston-deployment capston-pod-reactapp=wardahsana/capproj:latest'

          
            }
          }
       }

    