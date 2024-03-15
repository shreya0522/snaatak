def call(Map config = [:]) 
{
    pipeline 
    {
        agent any

        parameters 
        {
            booleanParam(name: 'SKIP_CREDENTIAL_SCANNING', defaultValue: false, description: 'Skip credential scanning stage')
            booleanParam(name: 'SKIP_INSTALL_DEPENDENCIES', defaultValue: false, description: 'Skip code anlaysis')
            booleanParam(name: 'SKIP_STATIC_CODE_ANALYSIS', defaultValue: false, description: 'Skip code anlaysis')
            booleanParam(name: 'SKIP_UNIT_TEST', defaultValue: false, description: 'Skip UNIT TEST stage')
            booleanParam(name: 'SKIP_BUG_ANALYSIS', defaultValue: false, description: 'Skip bug analysis stage')
            booleanParam(name: 'SKIP_DEPENDENCY_SCANNING', defaultValue: false, description: 'Skip DEPENDENCY_SCANNING stage')
        }

        stages 
        {

            stage('Checkout') 
            {
            
                steps {
                    script {
                        def checkout = new org.mygurukulam.common.Checkout()
                        checkout.clone(config.url, config.creds, config.branch)
                    }
                }
            }

            stage('Credentials scanning') 
            {

                when {
                    expression { params.SKIP_CREDENTIAL_SCANNING == false }
                }

                steps {
                    script {
                        def c = new org.mygurukulam.common.CredentialScanning()
                        c.scane()
                    }
                }
            }

            
            stage('Install Dependencies') 
            {
                when 
                {
                    expression { params.SKIP_INSTALL_DEPENDENCIE == false }
                }
                steps 
                {
                    script 
                    {
                        def a = new org.mygurukulam.python.InstallDependencies()
                        a.dependency()
                    }
                }
            }

            stage('STATIC_CODE_ANALYSIS') 
            {
                when 
                {
                    expression { params.SKIP_STATIC_CODE_ANALYSIS == false }
                }
                steps 
                {
                    script 
                    {
                        def b = new org.mygurukulam.python.StaticCodeAnalysis()
                        b.analysis()
                    }
                }
            }
            
            stage('DEPENDENCY_SCANNING') 
            {
                when 
                {
                    expression { params.SKIP_DEPENDENCY_SCANNING == false }
                }
                steps 
                {
                    script 
                    {
                        def C = new org.mygurukulam.python.DependencyScanning()
                        c.dependency()
                    }
                }
            }

            stage('UNIT_TEST') 
            {
                when 
                {
                    expression { params.SKIP_UNIT_TEST == false }
                }
                steps 
                {
                    script 
                    {
                        def C = new org.mygurukulam.python.UnitTest()
                        c.test()
                    }
                }
            }

            stage('BUG_ANALYSIS') 
            {
                when 
                {
                    expression { params.SKIP_BUG_ANALYSIS == false }
                }
                steps 
                {
                    script 
                    {
                        def C = new org.mygurukulam.python.BugAnalysis()
                        c.analysis()
                    }
                }
            }
        

            stage('Clone Packer configuration') 
            {
                steps 
                {
                    script 
                    {
                        def checkout = new org.mygurukulam.common.Checkout()
                        checkout.clone(config.packerUrl, config.creds, config.branch)
                    }
                }
            }

            stage("Change version") 
            {
                steps 
                {
                    script 
                    {
                        def update = new org.mygurukulam.java.Update()
                        update.version(params.VERSION, config.packerFile)        
                    }
                }
            }

            stage("Build ami") 
            {
              steps 
                {
                script 
                {
                    def ami = new org.mygurukulam.common.BuildAMI()
                    ami.build(config.packerFile)        
                }
                }
            }
        }
    }
}

