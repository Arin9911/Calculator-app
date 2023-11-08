pipeline {
    agent any
    
    stages {
        stage("Code Checkout") {
            steps {
                echo "cloning the code"
                git url:"https://github.com/Arin9911/Calculator-app.git" , branch:"master"
            }
        }
        
        stage("Build") {
            steps {
                echo "Building the code by maven"
                sh "mvn clean package"
            }
        }
        
        stage("Docker image build") {
            steps {
                echo "building docker image"
                sh "docker build -t calculator-app . "
            }
        }
        
        stage("Image push to dockerhub") {
            steps {
                echo "pushing the image to dockerhub"
                withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker tag calculator-app ${env.dockerHubUser}/calculator-app:latest"
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerHubUser}/calculator-app:latest"
                }
            }
        }
        
        stage("Deploy") {
            steps {
                echo "Deploying app to ec2 server"
                sh "docker run -d -p 8000:8000 arin10/calculator-app:latest"
            }
        }
    }
}
