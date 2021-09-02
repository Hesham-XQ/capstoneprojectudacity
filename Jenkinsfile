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
                  script {
                    dockerimage = docker.build("wardahsana/capproj", "-f Dockerfile .")

                  }

        stage('Push image') {
              steps {
                  echo "Pushing image to DockerHub"
                  script { 
                    docker.withRegistry('', 'dockerhub') {
                      dockerimage.push()

                  }
        }
        stage('Create kube config file') {
              steps {
                withAWS(region: 'us-east-2', credentials: 'aws-access-id') {
                  sh '''
                            aws eks --region us-east-2 update-kubeconfig --name capstoneproj
                    '''

        stage('Deploy container to AWS EKS cluster') {
          steps {
              echo "Deploying to EKS cluster in AWS"
          