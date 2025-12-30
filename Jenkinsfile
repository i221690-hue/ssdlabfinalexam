
pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                  python3 -m venv venv
                  . venv/bin/activate
                  pip install --upgrade pip
                  pip install -r requirements.txt
                '''
            }
        }

        stage('Run Unit Tests') {
            steps {
                sh '''
                  . venv/bin/activate
                  pytest
                '''
            }
        }

        stage('Build Application') {
            steps {
                sh '''
                  mkdir -p dist
                  tar -czf dist/flask_app.tar.gz app.py requirements.txt
                '''
            }
        }

        stage('Deploy Application (Simulated)') {
            steps {
                sh '''
                  mkdir -p deploy_target
                  cp -r dist deploy_target/
                '''
            }
        }
    }
}
