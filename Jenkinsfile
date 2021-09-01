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
                    dockerimage = docker.build

                  }

        stage('Push image') {
              steps {
                  echo "Pushing image to DockerHub"
        }
        stage('Create kube config file') {
              steps {
                withAWS(region: 'us-east-2', credentials: 'some_access_id') {
                  sh '''
                            aws eks --region us-east-2 update-kubeconfig --name capstoneproj
                    '''

stage('Deploy blue container') {
  when { branch 'blue'}
}
stage('Redirect service to blue container') {
  when { branch 'blue'}
}
stage('Deploy green container') {
  when { branch 'green'}
}
stage('Redirect service to green container') {
  when { branch 'green'}
}