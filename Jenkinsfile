pipeline {
    agent{
        label "linuxnode"
    }
    
    stages{
        stage('SCM') {
            steps {
                git 'https://github.com/ish-6201/jenkins-docker-maven-java-webapp.git'
            }
        }
        
        stage('Build By Maven') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Build Docker Own Image') {
            steps {
                sh 'sudo docker build -t ishaan6201/webapp:${BUILD_TAG}   .  '
            }
        }
        
        stage('Push image to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'Docker_hub_Passwd', variable: 'DOCKER_HUB_PASSWORD')]) {
    // some block 
               sh "sudo docker login -u ishaan6201 -p $DOCKER_HUB_PASSWORD " 
}
                sh "sudo docker push ishaan6201/webapp:${BUILD_TAG}"
               
            }
        }
        
        stage('Deploy Web App In Dev Env') {
            steps {
                sh 'sudo docker rm -f neapp'
                sh 'sudo docker run -d -p 8081:8080 --name neapp ishaan6201/webapp:${BUILD_TAG}'
            }
        }
        
           stage('Deploy App in QA Env') {
            steps {
                sshagent(['QA_SSH_CRED']) {
                
                sh 'ssh -o StrictHostKeyChecking=no ec2-user@44.211.78.216 sudo docker rm -f neapp'
                 sh 'ssh ec2-user@44.211.78.216 sudo docker run -d -p 8081:8080 --name neapp ishaan6201/webapp:${BUILD_TAG} '
                }  
            }
        }
        
         stage('approved') {
            steps {
                script {
                Boolean userInput = input(id: 'Proceed1', message: 'Promote build?', parameters: [[$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Please confirm you agree with this']])
                echo 'userInput: ' + userInput

                if(userInput == true) {
                    // do action
                } else {
                    // not do action
                    echo "Action was aborted."
                }
            
                
            }
            }
        }
        
           stage('Deploy App In Production Env') {
            steps {
                sshagent(['QA_SSH_CRED']) {
                
                sh 'ssh -o StrictHostKeyChecking=no ec2-user@3.86.43.109 sudo docker rm -f neapp'
                 sh 'ssh ec2-user@3.86.43.109 sudo docker run -d -p 8081:8080 --name neapp ishaan6201/webapp:${BUILD_TAG} '
                }  
            }
        }
    
    }
    
    
}
