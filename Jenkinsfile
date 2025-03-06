pipeline {
    agent any

    stages {
        stage('Clonar y Actualizar Código') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[
                        url: 'https://github.com/RicardoYalico/websocket-client.git'
                    ]]
                ])
                sh 'pwd'
            }
        }

        stage('Construir y Desplegar Docker') {
            steps {
                script {
                    sh '''
                        docker build -t socket-client .
                        docker stop socket-client-container || true
                        docker rm socket-client-container || true
                        docker run -d -p 8001:8000 --name socket-client-container --restart unless-stopped socket-client
                        docker image prune -a -f
                    '''
                }
            }
        }
    }
}
