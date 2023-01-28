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
        bat 'docker build -t maven-webapp .'
        echo "Docker image built with tag : maven-WebApp " 
      }
    }
    stage("run") {
      steps 
      {
        echo "Running docker container.."
        bat 'docker run --rm maven-webapp'
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
