
# 原由

因為要將production的AP log塞到ELK，但需要透過logstash進行過濾以及轉換，所以需要一個環境來進行測試。

# 安裝環境

首先透過以下yml 並以docker-compose up -d 進行安裝

```yml
version: "3.8" # docker-compose 使用的版本
services:
  elasticsearch:
     image: elasticsearch:8.11.1 # 指定使用的docker image
     environment: # 環境變數
      - discovery.type=single-node # 使用single-node模式
      - network.host=0.0.0.0 # 開放所有網路
      - http.host=0.0.0.0 
      - xpack.security.enabled=true # 需打開才能連線
      - xpack.security.authc.api_key.enabled=true 
      - ELASTIC_PASSWORD=elastic # 預設密碼
     ports:
       - 9200:9200 # elastic search 使用的port
       - 9300:9300   
     healthcheck:
       test: nc -z localhost 9200 || exit 1 # 檢查是否有開啟port
       interval: 5s
       timeout: 10s
       retries: 100
  kibana:
     image: kibana:8.11.1
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
  grafana:
     image: ajeje93/grafana-mongodb:latest
     ports:
       - 3001:3000
  fleet-server:
    image: elastic/elastic-agent:8.10.3
    container_name: fleet-server
    user: root
    ports:
       - 8220:8220
    environment:
      - FLEET_SERVER_ENABLE=1
      - FLEET_SERVER_ELASTICSEARCH_HOST=http://elasticsearch:9200
      - FLEET_SERVER_SERVICE_TOKEN=AAEAAWVsYXN0aWMvZmxlZXQtc2VydmVyL3Rva2VuLTE3MDMxMjUzNjg0NDI6SWtnd1NaTGlRamFyeEdWbHJ1UG8tZw # 記得修改token
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
    image: elastic/elastic-agent:8.10.3
    container_name: agent01
    user: root
    environment:
      - FLEET_ENROLLMENT_TOKEN=OC13d2lvd0JLNVBBRFZPR01zeng6MHY4UENSS3FSUk9YMWxKQnFUbWtIUQ== #記得修改
      - FLEET_ENROLL=1
      - FLEET_URL=https://fleet-server:8220
      - FLEET_INSECURE=true
      - p 8200:8200
    ports:
      - 8200:8200
    depends_on:
      fleet-server:
        condition: service_healthy
  logstash:
    image: logstash:8.11.3
    container_name: logstash
    ports:
      - 5044:5044
      - 9600:9600
```


安裝logstash，安裝完後於 `/usr/share/logstash/config/` 下的 logstash.yml 設定如下

```
http.host: "0.0.0.0"
xpack.monitoring.elasticsearch.hosts: [ "http://elasticsearch:9200" ]
xpack.monitoring.elasticsearch.username: logstash_system # 
xpack.monitoring.elasticsearch.password: logstash_system #

```

接著修改於`/usr/share/logstash/pipeline/logstash.conf`

```
input {
  beats {
    port => 5044
  }
}

output {
  elasticsearch {
    hosts => ["http://elasticsearch:9200"]
    index => "logstash"
    user => "elastic"
    password => "elastic"
  }
}
```

即可從elastic search的kibana看到logstash的log

# filter

