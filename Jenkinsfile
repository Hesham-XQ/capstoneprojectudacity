pipeline {
    agent any
    stages {        

        stage('Install dependencies') {
              steps {
                  echo "Installing dependencies"
                  sh 'sudo npm i -g npm@latest'
                  sh 'sudo npm install --save react react-dom react-scripts'

            }      
                
        }              
    }
}