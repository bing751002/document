
# AWS

## Services
### RDS
- AWS 關聯是資料庫服務，可以選擇不同的資料庫引擎，例如MySQL、PostgreSQL、MariaDB、Oracle、SQL Server、Aurora
- Aurora 是AWS自己開發的資料庫引擎，相容於MySQL以及PostgreSQL，並且效能更好
- RDS 可以選擇不同的類型，例如
  - General Purpose (SSD)
  - Provisioned IOPS (SSD)
  - Magnetic
- 比起在 EC2 上佈建 DB，有著監控、自動更新OS、Multi-AZ (災難復原)、可擴充性佳…等選項
- 有自動backup，可以選擇時間以及保留天數，預設七天
- DB snapshot 可以手動建立，並且可以保留很久
- 有storage auto scaling，可以自動增加DB的大小
- Read replica 只負責讀取，不負責寫入，可以增加讀取效能，並且可以跨AZ
- 建立master時若沒選擇加密，，則之後的read replica也無法加密
- 建立snapshot時，若選擇加密，則之後的read replica也會加密
- 可以透過parameter group來設定DB的參數，例如character set、max connection、log、buffer size
### Aurora
- 空間是以10GB為單位增加
- 費用比RDS貴20%，可以有15個read replica
- 支援cross region replication
- 可使用 KMS ( Key Management Service ) 管理；SSL 加密；用 IAM 進行認證或是 Security Group 進行管理，不過不支援 SSH 連入

### Elastic Cache  
- 可以用redis或是memcached
- 作為DB的cache
- Redis 擁有 Auto-Failer，可 Backup, 還原並具備 High Availability；Memcached 則是將資料用多 node ( sharding ) 的方式處理，是一種多工處理的架構
- Caching 快取的導入需要考量：資料本身是否該被快取；是否有效；結構設計是否方便快取，再來才是考慮 Caching Pattern
- Lazy Loading ( Cache-Aside, lazy Population ) – 如果沒有辦法 Cache，則會造成 Latency；若資料本身更新的話，那會需要清除 Cache
- Write Through：如果有寫入一份資料(更新)，那會同時寫入到 Cache 中 ( Write Penalty 是 2 Requests，相比於 Read 是 3 個 Requests )
-  若採用 Write Through，相比於 Lazy Loading，會出現不少多餘的 Cache 資料。畢竟它不是由 Lazy Loading 機制實際觸發的
-  Cache 可以設置存續時間 ( TTL – Time-to-live )
### EC2
- IaaS
- 長搭配ELB、ASG、EBS、EFS、Route53、CloudFront、CloudWatch
- Bootstrapping: 建立instance透過user data來執行script，例如安裝軟體、下載檔案
- 一開始建立時會有個隨機的public IP，但是每次重啟都會變，所以不適合用來連線
- 可以透過Elastic IP來固定IP
- terminate 以及 stop後不會收費
- 需要先選擇類型
  - T 一般用途
  - c 運算優化
  - M/R 記憶體優化
#### 計費方式
- On-demand: 每小時收費，不需要長期使用的時候適合
- Reserved: 預先購買，可以選擇1年或3年，越長期越便宜，適合長期使用 (saving plan)
- Spot: 競標，可以設定最高價格，當價格低於最高價格時就會被停止，適合短期使用，隨時會被停用
- dedicated host: 一台host只能有一個tenant，適合有特殊需求的客戶
#### Security group
- 一個security group可以被多個EC2 instance使用
- 僅能包含allow rule，沒有deny rule
#### Stroage
- EBS 用來永久保存資料，可想像成一個 Network Drive
- EBS 綁定AZ，若要跨AZ需要先制作snapshot，再從snapshot建立新的EBS
- EC2 刪除時EBS不會被刪除，但是可以選擇一起刪除
- EC2 instance store 相當於instance的stroage，但是不會永久保存資料，當EC2 instance被刪除時，資料也會被刪除
#### Scability
- 指系統面對大流量時的能力，可以分為水平以及垂直
- vertical 是指將自身的處理能力提升，例如增加CPU、RAM
- horizontal 是指增加instance數量，建立分散是系統
- hiah availability: 系統在面對單點故障時，仍然可以維持正常運作
- Auto Scaling Group 是為了因應流量的變化透過自動增加EC2的instance數量
- 可以設定最小數量、預設數量以及最大數量
- 透過cloudwatch設定alarm，當alarm觸發時，ASG會自動增加或減少instance數量
- scaling policy 可以設定增加或減少的instance數量
- dynamic scaling 可以分為target tracking scaling以及step scaling
  - Scheduled scaling: 可以設定特定時間增加或減少instance數量
  - Predictive scaling: 可以預測流量，並提前增加或減少instance數量
  - Good metrics to scale on: CPU、Network、Request Count、Latency
- Scaling cooldown period: 當ASG增加或減少instance數量時，會有一段時間的cooldown，避免過度增加或減少
#### Load Balancing
- 將requests 分散到不同的instance上，對於使用者來說，只需要單一的DNS name，不需要知道背後有多少instance
- instances 之間需要定期檢查，若有instance down，則會自動將request分散到其他instance
-  CLB 支援 HTTP/HTTPS, TCP, SSL、ALB 支援 HTTP/HTTPS/WebSocket、NLB 支援 TCP, TLS, UDP、Gateway Load Balancer 支援 Network Layer (3)  的 IP Protocol
-  ALB 是作用於第7層，可以根據URL來分配request、CLB 是作用於第4層，可以根據port來分配request
-  透過 ALB，可以設置 Routing Table 轉址到不同的服務，對於 ECS 或是 Docker 的 Application 相當實用
-  跟 CLB 相比，你可以不需要多套的 CLB，可直接透過 ALB 轉址 ( multi-target-groups )
-  保留使用者登入的狀態，可以透過 cookie stickiness 來達成
#### Security
- SSL/TLS
- SSL憑證需要設定到期日並定期更新，可以透過AWS Certificate Manager來管理
- Load Balancer是使用X.509憑證，可以透過ACM來管理

### S3
- 可無限擴充
- 許多AWS服務都可以使用S3來儲存資料，例如EC2、EFS、RDS、Redshift、EMR、Lambda、Glacier
- key是full path name，例如s3://my-bucket/my-file.txt
- max object 5TB 超過要開啟multipart upload
- metadata list of text key/value pairs
- tags 
- 有板控但需要開啟才可以使用
- 
### DNS
- Route53 AWS
- 可細分成
  - Domain Registration
  - DNS Records
  - Zone file 
  - Name Server
  - Top Level Domain
- 可以使用nslook or dig來查詢DNS
- CNAMES 可以用來指向其他domain
- Alias 可以用來指向AWS resource，例如S3、CloudFront、ELB
- Route 53 的 Alias Records 可以指向 ELB, Cloudfront, S3 Website, VPC Endpoints……等。不過不能是 EC2 或是 DNS Name
- 可以使用failover，設定好要監控instance的health check，當instance down時，會自動將request轉到另一個instance
- geolocation 可以根據使用者的地理位置來將request轉到不同的instance
- 在設定DNS時可以填入多個value，當第一個value down時，會自動將request轉到下一個value
### EBS 
- EBS 用來永久保存資料，可想像成一個 Network Drive
- Volumn Types 可照size，IOPS，以及throughput來分類
  - SSD
    - General Purpose SSD (gp2)
    - Provisioned IOPS SSD (io1)
  - HDD
    - Throughput Optimized HDD (st1)
    - Cold HDD (sc1)
    - Magnetic (standard)
- GP可用於開機磁碟，但是IO不夠高
- IOPS SSD 可用於開機磁碟，IO高，但是價格高
- st1和s1為HDD，價格低，但是IO低
### EFS 
- 是一個 Network file system，可以被多個EC2 instance使用，但收費較為槓貴
- 可以跨AZ使用
  
### Lambda
### API Gateway
### CloudWatch
### AWS CloudShell
- 一個browser-based shell，可以用來執行AWS CLI
## general
### global 
- AWS 在全世界都有region，每個region有多個AZ
- 多數AWS service都是region-specific，但有些是global，例如IAM、Route53、CloudFront
- Edge Location: CDN endpoint，例如CloudFront
- 
### AWS CLI
### AWS SDK
### IAM
- IAM user: 一個AWS account可以有多個IAM user，每個user有自己的access key
- root A/C不應該被分享以及使用，只用來建立IAM user
- user 需要被指定group，group有權限，user inherit group的權限
- 預設所有permission都是deny，只有被明確指定的才是allow
- policy 可以針對CRUD做細部設定
- AWS的各項服務都必須先綁定IAM role，才能被使用，否則會出現permission denied
- 有些基本定義好的policy可以直接使用，例如AdministratorAccess，EC2FullAccess
- 
### Billing
### Virtual Private Cloud (VPC)
- VPC 是一個邏輯上的網路，可以在AWS上建立，並且可以自訂IP address range、subnet、route table、network gateway
- VPC 可以跨AZ，但是subnet不行
- VPC 可以跨region，但是subnet不行
- VPC是部屬AWS 資源的地方
- subnet是VPC內的單位，可以存放在不同的AZ當中
- 對外有個IGW (internet gateway)，可以讓VPC內的資源連線到internet
- NAT Gateway 可以讓private subnet連到internet

### NACL (Network Access Control List)
- NACL是一個firewall，可以設定inbound以及outbound的rule
- 可以有allow 以及 deny policy
- VPC flow logs 可以捕捉IP位置在VPC內的流量
- 