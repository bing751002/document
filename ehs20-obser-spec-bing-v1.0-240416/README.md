
<!--
---
marp: true
theme: uncover
---

-->
# 前言

此文件紀錄EHS 2.0 的可觀測性規範，包含OTel定義以及說明範例等等


# OpenTelemetry

# 使用 OpenTelemetry 的 .NET 可觀察性 (安裝篇)

# 前言

本篇文章主題為
1. 使用docker安裝ELK
2. 使用Auto instrumentation 於 .net
3. 使用Auto instrumentation 於 現有IIS的專案

本文撰寫時的OTel版本為: `1.25`


## ELK 安裝

本次使用Docker安裝ELK。本次使用的版本如下

- `Kibana: 8.13.0`
- `ElasticSearch: 8.12.2`
- `Elastic-Agent: 8.13.2`

