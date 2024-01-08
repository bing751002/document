```yaml
trigger: # 觸發的repo的branch，代表這個repo有變更時會觸發pipeline
  branches:
    include:
    - master

resources: # 這個pipeline會用到的資源，例如其他的pipeline
  repositories: 
  - repository: tplRepo
    type: git
    name: DevOps/DevOps
    ref: master
    trigger: none # 代表不會透過這個repo的變更來觸發pipeline

variables: # 變數
- template: env-variables.yaml@tplRepo
#- name: appName
#  value: "merchandise"
# - name: projectPath
#   value: ''

pool: $(agentPoolName) 
# 這個pipeline會用到的agent pool
# pool是一組可以執行pipeline的agent，agent可以是一台虛擬機器或是一個docker container
name: $(Date:yyyyMMdd).$(Rev:r).$(Build.BuildId).[$(Build.SourceBranchName)] # pipeline的名稱


stages: # pipeline的stage
- stage: Build
  jobs:
  - job: Build
    variables:
    - template: pipeline-template/ci-variables.yaml@tplRepo
    steps:
    - template: pipeline-template/ci-service-backend.yaml@tplRepo
      parameters:
        appName: $(Build.Repository.Name)
      #  projectPath: '$(projectPath)'
      #

```

```yaml
trigger: none

resources:
  repositories: 
  - repository: tplRepo
    type: git
    name: DevOps/DevOps
    ref: master
  pipelines: 
  - pipeline: ci-merchandise-service-backend
    source: ci-merchandise-service-backend
    trigger:
      branches:
      - master # 代表這個pipeline會在ci-merchandise-service-backend這pipeline因為master branch有變更而觸發成功時觸發

variables:
- template: env-variables.yaml@tplRepo

pool: $(agentPoolName)

stages:
- stage: 'CD_Demo'
  displayName: 'CD Demo'
  jobs:
  - deployment: Deploy
    environment: Demo
    strategy:
      runOnce:
        deploy:
          steps:
          - template: pipeline-template/cd-service-backend.yaml@tplRepo
            parameters:
              referencPipeline: ci-merchandise-service-backend
              namespace: azure-devops-demo
- stage: 'CD_Dev'
  displayName: 'CD Dev'
  jobs:
  - deployment: Deploy
    environment: Dev
    strategy:
      runOnce:
        deploy:
          steps:
          - template: pipeline-template/cd-service-backend.yaml@tplRepo
            parameters:
              referencPipeline: ci-merchandise-service-backend
              namespace: dev-ehs-merchandise

```

```yaml
trigger: none

resources:
  repositories: 
  - repository: tplRepo
    type: git
    name: DevOps/DevOps
    ref: master
  pipelines:
  - pipeline: ci-merchandise-service-frontend
    source: ci-merchandise-service-frontend
    trigger:
      branches:
      - master

variables:
- template: env-variables.yaml@tplRepo

pool: $(agentPoolName)

stages:
- stage: 'CD_Dev'
  displayName: 'CD Dev'
  condition:  succeeded()
  jobs:
  - deployment: Deploy_Dev
    environment: Dev
    strategy:
      runOnce:
        deploy:
          steps:
          - checkout: tplRepo
          - download: ci-merchandise-service-frontend
          - task: Bash@3
            displayName: 'merge yaml'
            inputs:
              targetType: 'inline'
              script: |
                ytt \
                  -f $(Build.SourcesDirectory)/application/service-frontend/ \
                  -f $(Pipeline.Workspace)/ci-merchandise-service-frontend/drop/image-values.yaml \
                  -f $(Build.SourcesDirectory)/application/env/dev-env.yaml  \
                  --output-files $(Build.ArtifactStagingDirectory)/yaml
          - task: oc-cmd@3
            displayName: 'oc apply'
            inputs:
              openshiftService: $(openshiftServiceConnection)
              cmd: 'apply -f $(Build.ArtifactStagingDirectory)/yaml'
          - task: PublishBuildArtifacts@1
            displayName: publish yaml
            inputs:
              PathtoPublish: "$(Build.ArtifactStagingDirectory)"

- stage: 'CD_Sit'
  displayName: 'CD Sit'
  dependsOn: CD_Dev
  jobs:
  - deployment: Deploy
    environment: Sit
    strategy:
      runOnce:
        deploy:
          steps:
          - task: CmdLine@2
            inputs:
              script: |
                echo Write your commands here
                echo Hello world

```



- pipeline　流程

CI 裏頭跑docker build, 執行dockerFile 產生image


- https://docs.vmware.com/tw/VMware-Tanzu-Kubernetes-Grid/2.3/tkg-deploy-mc/workload-clusters-ytt.html
- https://carvel.dev/ytt/docs/v0.39.0/#overview
- https://developer.ibm.com/blogs/yaml-templating-tool-to-simplify-complex-configuration-management/



# ytt 

- 一個yaml模板管理工具

`ytt  -f $(Build.SourcesDirectory)/openshift/echoapi/ -f $(Pipeline.Workspace)/ci-echoapi-service-backend/drop/image-values.yaml 
 --output-files $(Build.ArtifactStagingDirectory)/yaml
`

`$(Build.SourcesDirectory)/openshift/echoapi/` 模板來源

`$(Pipeline.Workspace)/ci-echoapi-service-backend/drop/image-values.yaml`  引用另一個模板做完參數輸入

`--output-files $(Build.ArtifactStagingDirectory)/yaml` 輸出的yaml檔案位置
