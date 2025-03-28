pipeline {
    agent any 
    environment {
        ENV_URL = "pipeline.google.com"
        SSH_CRED = credentials('ssh-cred') 
    }
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')
        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')
        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
    }
    // triggers { cron('*/1 * * * *') } # Sample Change....
    // triggers { pollSCM('*/1 * * * *') }
    stages {
        stage('Build') {
            steps {
                sh ''' 
                    echo "Budling the nodeJS App"
                    echo "Env Url is ${ENV_URL}"
                    echo "Running env command"
                    env 
                ''' 
            }
        }
        stage('Deploying') {
            environment {
                ENV_URL = "stage.google.com"
            }
            steps {
                echo "Deploying the nodeJS App"
                echo "Stage Env Url is ${ENV_URL}"
            }
        }
        stage('Checks') {
            steps {
                echo "Running Post Deployment Checks"
            }
        }
        stage('Maven 396') {
                tools {
                    maven 'mvn396' 
                }
            steps {
                sh 'mvn --version'
            }
        }
        stage('Maven 399') {
                tools {
                    maven 'mvn399' 
                }
            steps {
                sh 'mvn --version'
            }
        }
        stage('Parallel Stages') {
            parallel {
                stage('Unit Testing') {
                    steps {
                        sh 'echo Unit Testing'
                        sh "sleep 100"
                    }
                }
                stage('Integration Testing') {
                    steps {
                        sh 'echo Unit Testing'
                        sh "sleep 100"
                    }
                }
                stage('Functional Testing') {
                    steps {
                        sh 'echo Unit Testing'
                        sh "sleep 100"
                    }
                }
            }
        }
        stage('Deploying To Prod') {
            input {
                message "Should we continue?"
                ok "YES"
                submitter "admin"
                parameters {
                    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'YES or NO to proceed')
                }
            }
            steps {
                sh 'echo Running On Prod'
            }
        }
    }
}