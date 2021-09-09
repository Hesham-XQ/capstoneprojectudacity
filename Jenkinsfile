pipeline {
    agent any
    stages {
                     
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
                  sh 'docker build -t wardahsana/capprojj .
                  }
              }
        

        stage('Push image') {
              steps {
                  echo "Pushing image to DockerHub"
                  sh 'docker push wardahsana/capprojj'
                  }
                }
             
        

        stage('Create kube config file') {
              steps {
                withAWS(region: 'us-east-2', credentials: 'aws-access-id') {
                  sh '''
                            aws eks --region us-east-2 update-kubeconfig --name caps
                    '''
                }
              }
        

        stage('Deploy container to AWS EKS cluster') {
          steps {
            withAWS(region: 'us-east-2', credentials: 'aws_access_id') {
          echo 'Deploying to EKS cluster'
          sh 'aws eks --region us-east-2 update-kubeconfig --name caps'
          sh 'kubectl config use-context arn:aws:eks:us-east-2:610575826472:cluster/caps'
          sh 'kubectl apply -f deployment.yml'
          
            }
          }
       }

    }
}