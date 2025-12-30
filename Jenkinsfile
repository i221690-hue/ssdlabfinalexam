pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                echo 'Cloning GitHub repository...'
                git 'https://github.com/i221690-hue/ssdlabfinalexam.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing Python dependencies...'
                // Upgrade pip first
                bat 'python -m pip install --upgrade pip'
                // Install requirements
                bat 'python -m pip install -r requirements.txt'
            }
        }

        stage('Run Unit Tests') {
            steps {
                echo 'Running unit tests with pytest...'
                bat 'python -m pytest -q'
            }
        }

        stage('Build Application') {
            steps {
                echo 'Building application (creating dist folder and tarball)...'
                // Create dist folder if it does not exist
                bat 'if not exist dist mkdir dist'
                // Package app.py and requirements.txt into a tar.gz (requires tar in PATH, comes with Git Bash or Windows 10+)
                bat 'tar -czf dist\\flask_app.tar.gz app.py requirements.txt'
            }
        }

        stage('Deploy Application') {
            steps {
                echo 'Simulating deployment (copy files to deploy_test)...'
                // Create deploy_test folder if it doesn't exist
                bat 'if not exist deploy_test mkdir deploy_test'
                // Copy app.py and requirements.txt to deploy_test folder
                bat 'copy app.py requirements.txt deploy_test\\'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
