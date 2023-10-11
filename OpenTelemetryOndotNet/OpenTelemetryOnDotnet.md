
# 使用 OpenTelemetry 的 .NET 可觀察性 (安裝篇)

# 前言

本篇文章為紀錄如何在.NET中自動埋入OpenTelemetry並顯示於ELK stack

本文撰寫時的OTel版本為: `1.25`


## ELK 安裝

本次使用Docker安裝ELK。本次使用的版本如下

- `Kibana: 8.10.2`
- `ElasticSearch: 8.10.2`
- `Elastic-Agent: 8.10.2`

![Alt text](images/ELK.png)

透過下方docker-compose內容，並開啟`CMD`後輸入以下指令
```bash
docker-compose pull #下載image
docker-compose up #啟動container
```

docker-compose.yml內容如下

```yaml
version: "3.8"
services:
  elasticsearch:
     image: elasticsearch:8.10.2
     environment:
      - discovery.type=single-node
      - network.host=0.0.0.0
      - http.host=0.0.0.0
      - xpack.security.enabled=true
      - xpack.security.authc.api_key.enabled=true
      - ELASTIC_PASSWORD=changeme
     ports:
       - 9200:9200
       - 9300:9300   
     healthcheck:
       test: nc -z localhost 9200 || exit 1
       interval: 5s
       timeout: 10s
       retries: 100
  kibana:
     image: kibana:8.10.2
     ports:
       - 5601:5601
     environment:
       - ELASTICSEARCH_USERNAME="kibana_system"
       - ELASTICSEARCH_PASSWORD="kibana_system"      
     healthcheck:
       test: ["CMD-SHELL", "curl -u kibana_system:kibana_system -s http://localhost:5601/api/status"]
       interval: 5s
       timeout: 10s
       retries: 120
     depends_on:
      elasticsearch:
        condition: service_healthy
  fleet-server:
    image: elastic/elastic-agent:8.10.2
    container_name: fleet-server
    user: root
    ports:
       - 8220:8220
    environment:
      - FLEET_SERVER_ENABLE=1
      - FLEET_SERVER_ELASTICSEARCH_HOST=http://elasticsearch:9200
      - FLEET_SERVER_SERVICE_TOKEN=<TOKEN>
      - FLEET_SERVER_POLICY_ID=fleet-server-policy
      - FLEET_SERVER_ELASTICSEARCH_USERNAME=elastic
      - FLEET_SERVER_ELASTICSEARCH_PASSWORD=elastic
      - p 8220:8220
    healthcheck:
      test: ["CMD-SHELL", "curl -u elastic:elastic -s http://localhost:5601/api/status"]
    depends_on:
      kibana:
        condition: service_healthy
  agent01:
    image: elastic/elastic-agent:8.10.2
    container_name: agent01
    user: root
    environment:
      - FLEET_ENROLLMENT_TOKEN=<TOKEN>
      - FLEET_ENROLL=1
      - FLEET_URL=https://fleet-server:8220
      - FLEET_INSECURE=true
      - p 8200:8200
    ports:
      - 8200:8200
    depends_on:
      fleet-server:
        condition: service_healthy
```
下載後container並未全部啟動，須完成下方流程。

1. 進入ElasticSearch設定kibana的帳號密碼，首先進入elasticsearch container輸入以下指令

```bash
./bin/elasticsearch-setup-passwords interactive
```
可參考下方的gif圖，設定的密碼之後會用到，因此需要先記下來。
![Alt text](images/set-password.gif)

設定完`kibana_system`的密碼後，需要把密碼設定回`docker-compose.yml/kibana.ELASTICSEARCH_PASSWORD的欄位`

之後重跑一次`docker-compose up`

啟動後可以看到docker container如下，並且可以透過`localhost:5601`進入Kibana

![Alt text](images/kibana.png)

一進到頁面後需要輸入`elastic`的帳號才能進入，密碼為剛剛設定的密碼。

若遇到無法登入時需要進入到ES的container內修改密碼，指令如下

```bash
./elasticsearch-reset-password -u elastic
```
此指令代表要重設elastic這user的密碼，重設完後會得到新的密碼，輸入即可登入。

登入之後需要先設定fleet-server的policy，點選左方的menu選擇Management選區的`Fleet`

![Alt text](images/add-fleet-server.png)

接著請照以下流程設定

1. 選擇 `Add Fleet Server` 
2. 選擇`Advance`
3. 然後點選`Create Polity`
4. 當出現`Agent Policy Created`出現時，代表有成功。
5. 產生`service-token`
6. 將token貼回`docker-compose.yml/fleet-server.FLEET_SERVER_SERVICE_TOKEN`的欄位
7. 重啟`docker-compose up`
8. 回到網頁確認是否有連上fleet-server

流程可參考以下示範

![Alt text](images/add-fleet-server.flow.gif)

接著需要設定agent的policy，

![Alt text](images/add-agent.png)

1. 點選`Add Agent`
2. `Create Policy`
3. 在下方的Enroll找到`FLEET_ENROLLMENT_TOKEN`並貼回docker-compose裡面`agent01.FLEET_ENROLLMENT_TOKEN`的欄位
4. 重啟`docker-compose up`
5. 回到網頁確認是否有連上agent

可參考以下流程
![Alt text](images/add-agent.flow.gif)

接著要設定APM server，點選左方的menu選擇Management選區的`APM`

1. 選擇 `Add Data`
2. 選擇`Manage APM integration in Fleet`
3. `Add Elastic APM`
4. 需要將Host欄位的`localhost`改為 `0.0.0.0`
5. `Save and Continue`
6. 成功後選擇 `Add Elastic Agent`
7. 一樣複製`ENROLLMENT_TOKEN`並貼回docker-compose裡面`agent01.FLEET_ENROLLMENT_TOKEN`的欄位
8. 重啟`docker-compose`
9. 回到網頁確認是否有連上agent
10. 接著點進Agent裡面頁面旁邊的Setting，需要把elastissearch的網址從`localhost`改為`elasticsearch`

到此即設定完成，接著進management申請完API Key後，完成 `安裝OpenTelemetry 於.net`的步驟，即能看到APM資料，可參考以下流程。

 
![Alt text](images/add-apm-agent-flow.gif)


## 安裝OpenTelemetry 於 .net

以下安裝流程為參考Otel官方的[教學文件](https://opentelemetry.io/docs/instrumentation/net/getting-started/) 


1. 先建置測試專案

```bash
dotnet new web
```
2. 專案`Program.cs`內容
```csharp
using System.Globalization;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

var logger = app.Logger;

int RollDice()
{
    return Random.Shared.Next(1, 7);
}

string HandleRollDice(string? player)
{
    var result = RollDice();

    if (string.IsNullOrEmpty(player))
    {
        logger.LogInformation("Anonymous player is rolling the dice: {result}", result);
    }
    else
    {
        logger.LogInformation("{player} is rolling the dice: {result}", player, result);
    }

    return result.ToString(CultureInfo.InvariantCulture);
}

app.MapGet("/rolldice/{player?}", HandleRollDice);

app.Run();

```
3. 修改 properties/launchSetting.json
```json
{
  "$schema": "http://json.schemastore.org/launchsettings.json",
  "profiles": {
    "http": {
      "commandName": "Project",
      "dotnetRunMessages": true,
      "launchBrowser": true,
      "applicationUrl": "http://localhost:8080",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    }
  }
}

```
4. 使用auto-instrumentation的方式置入instrumentation

開啟power-shell (需要管理員權限)，並執行以下指令

```bash
$module_url = "https://github.com/open-telemetry/opentelemetry-dotnet-instrumentation/releases/latest/download/OpenTelemetry.DotNet.Auto.psm1"
$download_path = Join-Path $env:temp "OpenTelemetry.DotNet.Auto.psm1"
Invoke-WebRequest -Uri $module_url -OutFile $download_path -UseBasicParsing
Import-Module $download_path
Install-OpenTelemetryCore
$env:OTEL_TRACES_EXPORTER="none"
$env:OTEL_METRICS_EXPORTER="none"
$env:OTEL_LOGS_EXPORTER="none"
$env:OTEL_DOTNET_AUTO_TRACES_CONSOLE_EXPORTER_ENABLED="true"
$env:OTEL_DOTNET_AUTO_METRICS_CONSOLE_EXPORTER_ENABLED="true"
$env:OTEL_DOTNET_AUTO_LOGS_CONSOLE_EXPORTER_ENABLED="true"
Register-OpenTelemetryForCurrentSession -OTelServiceName "RollDiceService"
```
最後執行專案
```bash
dotnet run 
```
執行完後可以看到console內有openTelemetry的log

![Alt text](images/net-opentelemetry-log.png)

接著要開始把資料送到ELK，修改剛剛的configure如下:

```bash
$module_url = "https://github.com/open-telemetry/opentelemetry-dotnet-instrumentation/releases/latest/download/OpenTelemetry.DotNet.Auto.psm1"
$download_path = Join-Path $env:temp "OpenTelemetry.DotNet.Auto.psm1"
Invoke-WebRequest -Uri $module_url -OutFile $download_path -UseBasicParsing
Import-Module $download_path
Install-OpenTelemetryCore
$env:OTEL_TRACES_EXPORTER="otlp"
$env:OTEL_METRICS_EXPORTER="otlp"
$env:OTEL_LOGS_EXPORTER="otlp"
$env:OTEL_RESOURCE_ATTRIBUTES="service.name=rolling,service.version=1.0,deployment.environment=production"
$env:OTEL_EXPORTER_OTLP_ENDPOINT="http://localhost:8200"
$env:OTEL_EXPORTER_OTLP_HEADERS="Authorization=Bearer aExDTkE0c0JPc2prZXVqSkZmbjQ6MWI2dl9rUkdRYkNRR2dfamV3NnFlUQ=="
$env:OTEL_DOTNET_AUTO_TRACES_CONSOLE_EXPORTER_ENABLED="false"
$env:OTEL_DOTNET_AUTO_METRICS_CONSOLE_EXPORTER_ENABLED="false"
$env:OTEL_DOTNET_AUTO_LOGS_CONSOLE_EXPORTER_ENABLED="false"
Register-OpenTelemetryForCurrentSession -OTelServiceName "RollDiceService"
```

## 雜記

1. 寫在docker-compose的參數優先於進入container裡面設定的參數，例如`elasticsearch`的`discovery.type=single-node`，在container內設定後，會被`docker-compose.yml`裡面的`environment`覆蓋掉，因此要在`docker-compose.yml`裡面設定。
2. ELK 8.X系列建議都是用Fleet去設定，原有的 beats系列會逐漸退場

## Reference
[
Windows Powershell XXXX.ps1 檔案無法載入](https://blog.twtnn.com/2013/11/windows-powershell-xxxxps1.html)

[喬叔帶你上手 Elastic Stack - 探索與實踐 Observability 系列](https://training.onedoggo.com/tech-sharing/uncle-joe-teach-es-elastc-observability)
[云原生观测性--OpenTelemetry 之实战篇](https://zhuanlan.zhihu.com/p/602846826)

[APM-Server Error talk to ES](https://discuss.elastic.co/t/error-talk-to-server/328160)

[APM TSL Error](https://discuss.elastic.co/t/opentelemetry-agent-unable-to-connect-apm-server-over-secure-connection/280150/7)

[ElasticsSearch certificate](https://blog.csdn.net/UbuntuTouch/article/details/125989411)

[ElasticsSearch Security Setup](https://www.elastic.co/guide/en/elasticsearch/reference/master/security-basic-setup-https.html)

[Basic ElasticsSearch Security Setup](https://www.elastic.co/guide/en/elasticsearch/reference/8.10/security-basic-setup.html)

[ssl](https://juejin.cn/s/elasticsearch%20apm%20server%20ssl)

[](https://ithelp.ithome.com.tw/articles/10215214?sc=rss.iron)

[Elastic APM 8.0](https://blog.elliot.tw/?p=597)

[](https://elastic.martinliu.cn/chapter3/chapter3-1/5/)

[Elastic APM 8](https://blog.csdn.net/UbuntuTouch/article/details/124813605)

[Kibana encryption reerror](https://hakanmazi123.medium.com/elasticsearch-unable-to-create-actions-client-because-the-encrypted-saved-objects-plugin-is-missing-5736b9a7a1c1)