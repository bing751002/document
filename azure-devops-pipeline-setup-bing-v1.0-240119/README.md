
<!--
---
marp: true
theme: uncover
---

-->
# Azure DevOps Pipeline Setup

本文紀錄如何設定Azure DevOps Pipeline，透過pipeline來build code並push到Quay

以下為簡易流程說明

1. 點選pipeline -> new pipeline
2. 選擇yaml檔設定方式
3. 透過yaml設定要build的環境
4. run pipeline

以下為pipeline 內容說明

```yaml
# Docker
# Build a Docker image
# https://docs.microsoft.com/azure/devops/pipelines/languages/docker

trigger:
- master  #由master branch觸發

resources:
- repo: self #代表這個pipeline會用到的資源是自己
  clean: true #代表每次執行pipeline前會先清除資料夾

variables:
- template: ci-variables.yml # 這個pipeline會用到的變數，透過template的方式引入

pool: $(agentPoolName) # 這個pipeline會用到的agent pool

stages:
- stage: Build
  displayName: Build image
  jobs:
  - job: Build
    displayName: Build
    steps:
    - task: Docker@2
      displayName: Build an image
      inputs:
        command: build
        dockerfile: '$(Build.SourcesDirectory)/src/Dockerfile'
        containerRegistry: '$(containerRegistryServiceConnection)'
        repository:  '$(containerRepository)'
        tags: 'latest'
    
    - task: Docker@2
      displayName: Push Image
      inputs:
        containerRegistry: '$(containerRegistryServiceConnection)'
        repository: '$(containerRepository)'
        command: 'push'
        tags: 'latest'

```
以下為變數設定檔


```yaml 
variables:
  agentPoolName: vmss-ado-agent # 需要透過這個Agent去連接quay
  containerRegistryServer: 'sit-quay.etzone.net' # quay的server
  containerRepository: 'bing_su/test'
  containerRegistryServiceConnection: 'quay_bing' #TODO:抽出去避免一直被檢查
  openshiftServiceConnection: 'Ocp'
  DOCKER_BUILDKIT: 1
```