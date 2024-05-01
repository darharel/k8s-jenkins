pipeline {
	environment {
		registry = "shaysardam/weather_app"
		DOCKER_LOGIN = credentials('docker_hub_login')
		SSH_KEY = credentials('ssh')
		}

    agent {
        label 'agent2'
    }

    stages {
        stage('Docker Build') {
            steps {
                dir('python3-final-project') {
                	sh "docker build -t $registry:${GIT_COMMIT} -f Dockerfile ."
                	sh "docker tag $registry:${GIT_COMMIT} $registry:latest"
                }
            }
        }
        stage('Run Application') {
            steps {
            sh 'docker run --rm -d -p 8000:8000 --name myapp $registry:${GIT_COMMIT}'
            sh 'sleep 5'
            }
        }
        stage('Run Tests') {
            steps {

            	dir('python3-final-project') {
                	sh 'python3 test_unit.py'
                }

            }
        }
        stage('Docker Login And push ') {
            steps {
				sh 'docker login --username ${DOCKER_LOGIN_USR} --password ${DOCKER_LOGIN_PSW}'
				sh "docker push $registry:${GIT_COMMIT}"
				sh "docker push $registry:latest"
			}
		}



        stage('Deploy Helm Chart') {
            steps {
                    // aws eks describe-cluster --name my-cluster >>> to check the eks cluster  serverUrl
                    withKubeConfig(clusterName: 'my-chart', credentialsId: 'eks_token', namespace: 'default', serverUrl: 'https://EC1C09704B791E6403E5709B5305E059.gr7.il-central-1.eks.amazonaws.com')
                    {
                    // Install Helm chart and override repository and tag values
                    sh "helm upgrade my-chart ./my-chart --set weatherApp.image.repository=${registry},weatherApp.image.tag=${GIT_COMMIT},weatherApp.configMapName=weather-app-green-config"
                    // weatherApp.configMapName=weather-app-blue-config >>>if i want to overwrite the background
                    }
                }

            }
        }
               
    
    post {
    	success{
    		slackSend(channel: 'jenkins', color: "good", message: "SUCCESS")
    	}
    	failure{
    		slackSend(channel: 'jenkins', color: "danger", message: "FAILED")
    	}
        always {
            sh 'docker stop myapp'
            cleanWs()
        }
    }
}


//IAM access entries add in the end