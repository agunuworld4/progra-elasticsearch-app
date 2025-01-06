//${library.jenkins-slack-library.version}
//@Library('Slack-us-east-jenkins-prod') _

pipeline {

  agent { label 'gcloud-java-slave-node' }

  options {
       buildDiscarder logRotator(
           artifactDaysToKeepStr: '5',
           artifactNumToKeepStr: '5',
           daysToKeepStr: '5',
           numToKeepStr: '5')
          timestamps()
        }

  environment {
    BUILD_NUMBER ="${env.BUILD_ID}"
    }

  stages {
    stage('Cloning Git') {
            steps {
            git branch: 'lab-master-branch', credentialsId: 'democalculus-github-login-creds', url: 'https://github.com/agunuworld4/progra-elasticsearch-app.git'
          }
        }

    // stage('Deploy helm charts for prom and Grafana') {
    //       steps {
    //             sh "bash prometheus-grafana.sh"
    //             }
      //      }

    stage('Helm, ingress installed') {
            steps {
              parallel(
                  "helm ingress installed": {
                     sh 'bash helm-ingress-installed.sh'
                    },
                    "prom grafana installed": {
                      sh 'bash prometheus-grafana.sh'
                      },
                      "Deploy ingress rule": {
                        sh 'bash ingresss_rules.sh'
                        }
                      )
                    }
                }

  }  //This line end the pipeline stages
  //post {   //This line start the post script
  //      always {
    //     sendNotification currentBuild.result
      //  }
  //}  //this line close post script stage
}    //This line close the jenkins pipeline
