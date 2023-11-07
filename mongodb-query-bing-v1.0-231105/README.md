# 使用mongodb語法計算每個欄位出現的次數

## 原由

因維運組希望計算某mongo collection中每個欄位出現的次數，以便後續做資料分析，因此我們需要將每個欄位的值都列出來，並計算出現的次數。

一開始想法是用nodejs程式連結mongodb撈出資料後進行計算，但後來發現效能太差，因此改用mongodb語法進行計算。

以下語法以及說明

note : 2023-11-05T00:00:00+0800 代表+8時區

### Step.1 撈出需要計算的資料

要撈出`Log_SalesMix_Lite`此collection 中`trg_create_on`欄位在`2023-11-05T00:00:00+0800`到`2023-11-05T01:00:00+0800`之間的資料

```js
 {
        $match: {
            trg_create_on: {
                $gte: ISODate("2023-11-05T00:00:00+0800"),
                $lt: ISODate("2023-11-05T01:00:00+0800")
            }
        }
    },
```
### Step.2 根據primary_key分組，並把data放進一個array中

```js
{
        $group: {
            _id: "$primary_key",
            data: { $push: "$$ROOT" }
        }
    },
```
### Step.3 將data中的欄位都列出來並且將data array轉成object

```js
{
        $project: {
            _id: 1,
            data: 1,
            // 列举所有其他字段，或者使用自动生成的字段列表
        }
},
{
        $unwind: "$data"
},
```
### Step.4 重新組合object，並且將每個欄位轉成key-value的形式

```js
{
        $replaceRoot: { newRoot: "$data" }
    },
    {
        $project: {
            _id: 0,
            trg_create_on: 1,
            // 使用 $objectToArray 将文档转换为键值对数组
            fields: { $objectToArray: "$$ROOT" }
        }
    },
    {
        $unwind: "$fields"
    },
```

### Step.5 根據key做group並計算次數

```js
{
  $group: {
     _id: {
        field: "$fields.k"
            },
            count: { $sum: 1 },
         //   values: { $addToSet: "$fields.v" }
        }   },
    {
    $group: {
        _id: 
    ISODate("2023-11-05T00:00:00+0800"),  
    data: { $push: "$$ROOT" }
    }
},
```
### Step6. 重新組合資料並取出所需要的data

```js
{
        $project: {
            _id: 1,
            result: {
                $arrayToObject: {
                    $map: {
                        input: "$data",
                        as: "item",
                        in: {
                            k: "$$item._id.field",
                            //v: {
                            //    count: "$$item.count",
                             //   values: "$$item.values"
                            //}
                           v:"$$item.count"
                        }
                    }
                }
            }
        }
    },
    {
        $replaceRoot: { newRoot: "$result" } // 将 result 字段作为新的根
    },
```
### Step7. 加入新的欄位並將結果寫入新的collection

```js
{ 
  $addFields: { _id: ISODate("2023-11-05T00:00:00+0800")  } },
 {
       $merge: {
            into: "Log_SalesMix_Summary" // 将结果添加到现有集合
      }
  }
```

以下為全部語法

```js 
db.Log_SalesMix_Lite.aggregate([
    {
        $match: {
            trg_create_on: {
                $gte: ISODate("2023-11-05T00:00:00+0800"),
                $lt: ISODate("2023-11-05T01:00:00+0800")
            }
        }
    },
    {
        $group: {
            _id: "$primary_key",
            data: { $push: "$$ROOT" }
        }
    },
    {
        $project: {
            _id: 1,
            data: 1,
            // 列举所有其他字段，或者使用自动生成的字段列表
        }
    },
    {
        $unwind: "$data"
    },
    {
        $replaceRoot: { newRoot: "$data" }
    },
    {
        $project: {
            _id: 0,
            trg_create_on: 1,
            // 使用 $objectToArray 将文档转换为键值对数组
            fields: { $objectToArray: "$$ROOT" }
        }
    },
    {
        $unwind: "$fields"
    },
        {
        $group: {
            _id: {
                field: "$fields.k"
            },
            count: { $sum: 1 },
         //   values: { $addToSet: "$fields.v" }
        }   },
    {
    $group: {
        _id: 
 ISODate("2023-11-05T01:00:00+0800"),       data: { $push: "$$ROOT" }
    }
},
{
        $project: {
            _id: 1,
            result: {
                $arrayToObject: {
                    $map: {
                        input: "$data",
                        as: "item",
                        in: {
                            k: "$$item._id.field",
                            //v: {
                            //    count: "$$item.count",
                             //   values: "$$item.values"
                            //}
                           v:"$$item.count"
                        }
                    }
                }
            }
        }
    },
    {
        $replaceRoot: { newRoot: "$result" } // 将 result 字段作为新的根
    },
    { $addFields: { _id: ISODate("2023-11-05T00:00:00+0800")  } },
 {
        $merge: {
            into: "Log_SalesMix_Summary" // 将结果添加到现有集合
      }
  }
])
```

## 後來用C#語法改寫以便可以加入排程

```c#
using System;
using System.Linq;
using MongoDB.Bson;
using MongoDB.Driver;


namespace runMongoDailyJob
{
    internal class Program
    {
        static void Main(string[] args)
        {

            string mongodbHost = Environment.GetEnvironmentVariable("MONGODB_HOST") ?? "admin:Aa123456@172.21.17.34"; // 默认值为 "localhost"
            string mongodbPort = Environment.GetEnvironmentVariable("MONGODB_PORT") ?? "27017"; // 默认值为 "27017"
            string databaseName = "mcDataCenter"; // 你的数据库名称

            string connectionString = $"mongodb://{mongodbHost}:{mongodbPort}";

            MongoClient client = new MongoClient(connectionString);
            IMongoDatabase database = client.GetDatabase(databaseName);
            IMongoCollection<BsonDocument> collection = database.GetCollection<BsonDocument>("Log_SalesMix_Lite");
            
            DateTime currentTime = DateTime.Now;
            DateTime currentHour = currentTime.Date.AddHours(currentTime.Hour);

            // 计算前一个小时的时间
            DateTime oneHourAgo = currentHour.AddHours(-1);

            var matchStage = new BsonDocument("$match", new BsonDocument
            {
    { "trg_create_on", new BsonDocument
        {
            { "$gte", oneHourAgo },
            { "$lt", currentHour }
        }
    }
});

            var sortStage = new BsonDocument("$sort", new BsonDocument
        {
            { "trg_create_on", 1 }
        });

            var groupStage = new BsonDocument("$group", new BsonDocument
        {
            { "_id", "$primary_key" },
            { "data", new BsonDocument("$push", "$$ROOT") }
        });

            var unwindStage1 = new BsonDocument("$unwind", "$data");

            var replaceRootStage = new BsonDocument("$replaceRoot", new BsonDocument
        {
            { "newRoot", "$data" }
        });

            var projectStage = new BsonDocument("$project", new BsonDocument
        {
            { "_id", 0 },
            { "trg_create_on", 1 },
            { "fields", new BsonDocument("$objectToArray", "$$ROOT") }
        });

            var unwindStage2 = new BsonDocument("$unwind", "$fields");

            var groupStage2 = new BsonDocument("$group", new BsonDocument
        {
            { "_id", new BsonDocument("field", "$fields.k") },
            { "count", new BsonDocument("$sum", 1) }
        });

            var groupStage3 = new BsonDocument("$group", new BsonDocument
        {
            { "_id", oneHourAgo },
            { "data", new BsonDocument("$push", "$$ROOT") }
        });

            var projectStage2 = new BsonDocument("$project", new BsonDocument
        {
            { "_id", 1 },
            { "result", new BsonDocument("$arrayToObject", new BsonDocument
                {
                    { "$map", new BsonDocument
                        {
                            { "input", "$data" },
                            { "as", "item" },
                            { "in", new BsonDocument
                                {
                                    { "k", "$$item._id.field" },
                                    { "v", "$$item.count" }
                                }
                            }
                        }
                    }
                })
            }
        });

            var replaceRootStage2 = new BsonDocument("$replaceRoot", new BsonDocument
        {
            { "newRoot", "$result" }
        });

            var addFieldsStage = new BsonDocument("$addFields", new BsonDocument
        {
            { "_id", oneHourAgo }
        });
            var mergeStage = new BsonDocument("$merge", new BsonDocument
        {
            { "into", "Log_SalesMix_Summary" }
        });
            var pipeline = new[]
            {
            matchStage, sortStage, groupStage, unwindStage1, replaceRootStage,
            projectStage, unwindStage2, groupStage2, groupStage3,
            projectStage2, replaceRootStage2, addFieldsStage,mergeStage
            // 添加其他阶段...
        };
            collection.Aggregate<BsonDocument>(pipeline)
        }
    }
}

```

## 在正式區執行一次約為3秒，可將約10萬筆的record所有欄位計算出來並寫入新的collection中