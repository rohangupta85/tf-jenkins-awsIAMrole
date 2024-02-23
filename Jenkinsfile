pipeline {
  agent  any
    stages {

      stage ('Checkout SCM'){
        steps {
          checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/rohangupta85/tf-jenkins-awsIAMrole.git']]])
        }
      }

     
      stage('Set Terraform path') {
       steps {
         script {
            def tfHome = tool name: 'terraform'
            env.PATH = "${tfHome}:${env.PATH}"
         }
     }
  }
  stage('terraform init') {
 
       steps {
           dir ("./") {
                script {
                    withAWS(roleAccount:'135159588584', role:'tf-jenkins-vpc-role', useNode: true) {
                    sh 'terraform init -no-color'
                    }
             }
           }
        }
      }

  stage('terraform Plan') {
 
       steps {
           dir ("./") {
            
               script {
                    withAWS(roleAccount:'135159588584', role:'tf-jenkins-vpc-role', useNode: true) {
                    sh 'terraform plan -no-color -out=plan.out'
                    }
               }
            }
        }
      }

  stage('Waiting for Approvals') {
            
      steps{
          input('Plan Validated? Ok to go ahead with VPC creation in AWS?')
			  }
      }    

  stage('terraform Apply') {
 
       steps {
           dir ("./") {
            
              script {
                    withAWS(roleAccount:'421588605339', role:'tf-jenkins-vpc-role', useNode: true) {
                    sh 'terraform apply -no-color -auto-approve plan.out'
                    sh "terraform output"
                    }
              }
            
           }
        }
      }
   }
}
