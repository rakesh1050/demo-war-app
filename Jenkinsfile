pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven-3.9.9"
    }

    stages {
        stage ("Checkout"){
            steps{
                git branch: 'main', url: 'https://github.com/rakesh1050/demo-war-app.git'
            }
        }
        stage('Build') {
            steps {
                // // Run Maven on a Unix agent.
               sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }  
        }
        stage("Docker Build"){
            steps{
                sh "docker image build -t rakesh1050/sampleapp ."
            }
        }
        stage("Docker Run"){
            steps{
                sh "docker container rm -f $(docker container ls -aq)"
                sh "docker container run -itd -p 8090:8080 rakesh1050/sampleapp"
            }
        }
    }
}
