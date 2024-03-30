---
marp: true
theme: gaia
---
# SCM System Dashboard Integration
## Bing
---
# 目標
- 一個整合App層重要服務狀態的頁面
  - ex. 滔寶Requests進來的量以及處理速度
- 可快速查詢所要監測的訊息
- 找出要監測的目標並且量化關鍵服務的狀態
- 透過Grafafa Alert提供即時通知
- 提供除錯流程SOP，讓任何人都可以照著SOP快速找到問題點
---
# Source 來源
- IIS Log
- HAproxy Log
- SCM application log 
---
# application log Flow
- log to file -> filebeat filter tag -> logstash(FluentD) -> elasticsearch -> grafana
---
# Filter Tag
- 暫定`[ELK]`
---
# Log Content
- request payload
- response payload
- application log
- response time
---
# Dashboard Type
- Query From ELK/MySQL
- PRTG Link 
- Other 
---
# Alert 
- Grafana Alerts 
---
# Target
- 滔寶request以及消化量
- ...more