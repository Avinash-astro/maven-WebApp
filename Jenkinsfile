pipeline {
  agent any
  stages {
    stage ("Git checkout"){
      steps
      {
        echo "checking out souce code from GitHub"
        git branch: 'feature', url: 'https://github.com/Avinash-astro/maven-WebApp'
      }
    }
    stage("Build") {
      steps 
      {
        echo "Building docker image.."
        bat 'docker build -t maven-build-deploy .'
        echo "Docker image built with tag : maven-build-deploy " 
      }
    }
    stage("run") {
      steps 
      {
        echo "Running docker container.."
        bat 'docker run -d --name=maven-build-deploy-1 -p 9090:8080 maven-build-deploy'
        echo "Tomcat container URL: http://localhost:9090/SampleApp/"
      }
    }
  }
  post {
    success {
      echo "Build successful.."
    }
    failure {
       echo "Build failed.."
    }
  }
}
