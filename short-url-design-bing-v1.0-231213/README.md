# 盤點

# 以終為始，以下為預期成果

- 以.net core重新撰寫一個縮網址的服務
- 產生出一個docker image，功能為提供縮網址功能的REST API
- 部屬在 OCP 上
- 參考IBM流程，透過Azure devops完成 CICD
- 含有unit test
- 需要透過PR來進行code review並merge code
- 需要透過branch policy來限制PR的merge
- 參考原本的程式流程
- 服務SLO. ex: 每秒可達到多少request
- 要能完全相容目前的版本
- 用OTel並在kibana/grafana上監測並建立alert
- 一後臺管理介面，可以看到縮網址的使用狀況，以及紀錄
- 測試效能，預期要優於目前的版本

# Todo

- 軟體邏輯/架構
- coding style guide
- unit test guide
- azure repo
- 整合性測試
- 效能測試

## 分組

- DevOps 
  - CICD flow
  - Azure devops設定
  - azure repo
  - git flow / commit flow / PR
- Study 
  - 程式邏輯研究規劃　
  - 架構設計
  - coding style guide
  - VS format style config

分工:

DevOps: Bing
Study: Siugar, Robbin, Matrix, Jim, 昀珊, 雅芳

12/20 分工確定/
12/31 原有程式的邏輯
1/15 新的軟體架構/開工
2/28 效能測試
3/15 完成