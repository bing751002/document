
<!--
---
marp: true
theme: uncover
---

-->
# taobao

- 變價變量，銷售狀態變更 走DB
- 規格表變更 走rabbitmq，只有完成requests完後才會進DB
```sql
select top 1 * from TaobaoNotificationMessage --待處理、處理中
select top 1 * from TaobaoNotificationMessage_Log -- 處理完成
select top 1 * from TaobaoNotificationMessageRmq -- RMQ處理完成
```
- 滔寶訂單狀態 https://redmine.etzone.net/projects/b2e/wiki/%E5%BA%97%E4%B8%AD%E5%BA%97_API

```sql
SELECT
   DATEADD(MINUTE, (DATEDIFF(MINUTE, 0, createTime) / 5) * 5, 0) AS FiveMinuteInterval,
       COUNT(*) AS RecordCount
FROM
    FRI_MLEC.dbo.TaobaoNotificationMessage  -- 將 "yourTableName" 替換為實際的資料表名稱
WHERE
    createTime BETWEEN '2023-12-01' AND '2023-12-31'
GROUP BY
   DATEADD(MINUTE, (DATEDIFF(MINUTE, 0, createTime) / 5) * 5, 0)
ORDER BY 
   DATEADD(MINUTE, (DATEDIFF(MINUTE, 0, createTime) / 5) * 5, 0)

```

淘寶訂單收到時會先寫到 `TaobaoNotificationMessage`，然後當request處理完後會寫到`TaobaoNotificationMessage_log` 並且刪除`TaobaoNotificationMessage`的資料

```
   NOT_STARTED = 0,
   SUCCESS = 1,
   DUPLICATE_FOUND = 2,
   SUCCESS_BUT_PICTURE_FAILED = 3,
   IN_PROCESS = 4,
   REDIS_LOCKED = 5,
   FAILED_ON_CONVERT = 101,
   FAILED_ON_VALIDATION = 102,
   FAILED_ON_TBX001 = 201,
   FAILED_ON_TBX002 = 202,
   FAILED_ON_TBX003 = 203,
   FAILED_ON_TBX004 = 204,
   FAILED_ON_WRITE_TO_FUGO = 205,
   FAILED_ON_TBX034 = 206,
   FAILED_ON_WRITE_BACK_FORMAL = 301,
   [Description("未指定規格表(FormID)")]
   FAILED_ON_CATEGORY_REFLECTION_NOT_SET_FORMID = 413,
   [Description("規格表驗證失敗(FormID)")]
   FAILED_ON_FORM_VALIDATION = 414,
   FAILED_ON_CHANGE_SPEC = 419,
   FAILED_ON_CHANGE_PRICE_OF_PART_SKU = 503,
   FAILED_ON_CHANGE_PRICE_OF_SALESMIX = 504,
   FAILED_ON_CHANGE_PRICE = 509,
   FAILED_ON_CHANGE_STATUS_OF_PART_SKU_OR_SPU = 603,
   FAILED_ON_CHANGE_STATUS = 609,
   FAILED_ON_CHANGE_QTY_OF_PART_SKU = 703,
   FAILED_ON_CHANGE_QTY = 709,
   [Description("查詢TaobaoProductDetail發生錯誤 或 查無任何一筆SPU商品")]
   FAILED_ON_TAOBAO_QUERY_DETAIL = 801,
   FAILED_ON_FORMER_SALE_CODE__NOT_FOUND = 802,
   [Description("該SalesMix銷售狀態為已下市")]
   FAILED_ON_SALESMIX_PULLED_OFF_SHELF = 803,
   FAILED_ON_PAN_SKU_NOT_FOUND = 804,
   [Description("查詢TaobaoProductDetail部分商品無回應")]
   FAILED_ON_TAOBAO_QUERY_DETAIL_LOST = 805,
   [Description("該SalesMix銷售狀態為銷售不可")]
   FAILED_ON_SALESMIX_NO_SALE = 806,
   [Description("找不到淘寶分類對應")]
   FAILED_ON_CATEGORY_REFLECTION_NOT_FOUND = 807,
   [Description("找不到Product")]
   FAILED_ON_PRODUCT_NOT_FOUND = 808,
   [Description("找不到SalesMixCommon")]
   FAILED_ON_SALESMIX_COMMON_NOT_FOUND = 809,
   UNKNOWN_ERROR = 999
   ```