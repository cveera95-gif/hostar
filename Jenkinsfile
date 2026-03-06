pipeline {
    agent any
    stages {
        stage ('git checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'cveera95-gifs', url: 'https://github.com/cveera95-gif/hostar.git']])
            }
        }
        stage ('vlidate') {
            steps {
                sh 'mvn validate'
            }
        }
        stage ('compile') {
            steps {
                sh 'mvn compile'
            }
        }
        stage ('tset') {
            steps {
                sh 'mvn test'
            }
        }
        stage ('pacage') {
            steps {
                sh 'mvn package'
            }
        }
        stage ('crating image') {
            steps {
                sh 'docker rmi hotstar-img || true '
                sh 'docker build -t hotstar-img  . '
            }
        }
        stage ('creating container') {
            steps {
                sh 'docker rm -f hot-cont || true '
                sh 'docker run -itd --name hot-cont -p 8085:8080 hotstar-img '
            }
        }
    }
}
