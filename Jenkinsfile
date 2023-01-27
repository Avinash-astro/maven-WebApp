pipeline 
{ 
    agent 
    {
        dockerfile{
            //image "maven:3.6.0-jdk-13"
            //label "docker"
        }
    } 
    stages 
    {
        stage ('Git checkout')
        {
            steps
            {
                echo "checking out souce code from GitHub"
                git branch: 'main', url: 'https://github.com/Avinash-astro/maven-WebApp'
            }
        }
//         stage ('User input')
//         {
//             steps
//             {
//                 /*input message: 'pls provide the user input', parameters: [choice(choices: ['proceed', 'abort'], description: '''clicking Proceed will build the application .
// Clicking abort will stop the build''', name: 'Proceed to build the app ?')]*/
//                 input 'Proceed to build the app ?'
//             }
//         }
        stage ('Build')
        { 
            steps 
            {
               echo "building"
               bat 'java -version'
               bat 'mvn --version'
               bat 'mvn clean install'
               echo "mvn clean install completed using maven docker image "
            }
        }
        // stage ('Deploy') 
        // { 
        //     steps
        //     {
        //         echo "Deploying the app in Tomcat server"
                
        //         bat 'dir'
        //         bat "copy target\\SampleApp.war E:\\Avi\\apache-tomcat-10.0.27\\apache-tomcat-10.0.27\\webapps"
        //         bat 'dir'
                
        //         echo "Default Tomcat URL http://localhost:8181/ "
        //     }
        // }

    }
    
    post {
    success {
      echo "'Send mail on success'"
    }
    failure {
       echo "'Send mail on failure'"
    }
  }
}
