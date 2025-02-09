pipeline {
    agent any

    environment {
        LOG_FILE = "/var/log/apache2/access.log"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Elevsin/Jenkinsfile.git'
            }
        }

        stage('Update System') {
            steps {
                sh 'sudo apt update'
            }
        }

        stage('Install Apache') {
            steps {
                sh 'sudo apt install -y apache2'
            }
        }

        stage('Change Apache Port') {
            steps {
                sh '''
                sudo sed -i 's/Listen 80/Listen 8181/g' /etc/apache2/ports.conf
                sudo sed -i 's/<VirtualHost \\*:80>/<VirtualHost *:8181>/g' /etc/apache2/sites-available/000-default.conf
                '''
            }
        }

        stage('Restart Apache') {
            steps {
                sh 'sudo systemctl restart apache2 && sudo systemctl enable apache2'
            }
        }

        stage('Check Logs for Errors') {
            steps {
                sh 'bash check_logs.sh'
            }
        }

        stage('Notify Deployment Status') {
            steps {
                echo "Deployment Completed Successfully!"
            }
        }
    }
}
