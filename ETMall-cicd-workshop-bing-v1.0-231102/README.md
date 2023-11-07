![Alt text](images/1.png)

- ACM 有自有的subscription model

![Alt text](images/2.png)

- imperative `直接式` 直接用cli建立
- declarative `宣告式` 透過yaml檔案建立 可做版控

![Alt text](images/3.png)

![Alt text](images/4.png)
![Alt text](images/5.png)

- push式 賦予權限給k8s
- pull式 k8s自己去取得權限

![Alt text](images/6.png)

- 須嚴格遵守single source of truth
- 透過gitops來達成 

- ACM Application Subscription Model

![Alt text](images/7.png)

- 在創建時需要指定要sync的 repo 位置
- repo 帳號暴露給 k8s, 讓k8s可以去pull
- plcaement rule 紀錄要部屬到哪個cluster
- channel 紀錄要部屬到哪個namespace
- subscription 紀錄要部屬到哪個application

![Alt text](images/8.png)

ACM subscrition model 範例

![Alt text](images/9.png)

- kustomization.yaml

![Alt text](images/10.png)

[參考](https://www.netron.asia/tw/newsDetail/34?kustomize)

![Alt text](images/11.png)
![Alt text](images/12.png)

- kustomize 會將所有的yaml檔案合併成一個

![Alt text](images/13.png)
![Alt text](images/14.png)

- 整合ansible Automation platform integration
![Alt text](images/15.png)

![Alt text](images/16.png)

![Alt text](images/17.png)

# Universal Base Image & Quay

![Alt text](images/18.png)

- 挑選適合的base image
- Red UBI 介紹
- Quay for org
- RBAC

![Alt text](images/19.png)

挑選base image 的考量

- 架構
- 安全性
- 效能

![Alt text](images/20.png) 

![Alt text](images/21.png)

![Alt text](images/22.png)

![Alt text](images/23.png)