# E2E 測試框架介紹

## 概述

將比較現在較流行的 E2E 測試框架 Cypress、Protractor、Selenium、Nightwatch 並選出一套

## 比較

|                                                 | 錄製腳本 |  UI  | 可視化瀏覽器測試 | Headless | 報表產出 | 支援語言                | 使用 WebDriver | GitHub 星數 |
| ----------------------------------------------- | :------: | :--: | :--------------: | :------: | :------: | :---------------------- | :------------: | ----------- |
| [Cypress](https://www.cypress.io/)              |    O     |  O   |        O         |    O     |    O     | Javascript              |       X        | 26.3k       |
| [Protractor](https://www.protractortest.org/#/) |    O     |  X   |        O         |    O     |    O     | Javascript              |       O        | 8.7k        |
| [Selenium](https://www.selenium.dev/)           |    O     |  O   |        O         |    O     |    O     | Javascript、C#、Java 等 |       O        | 19.5k       |
| [Nightwatch](https://nightwatchjs.org/)         |    O     |  X   |        O         |    O     |    O     | Javascript              |       O        | 10.5k       |

### 什麼是 WebDriver?

舊稱 Selenium WebDriver，現為 W3C 管理，稱為 WebDriver API 

這是用來操作瀏覽器的一個 API 介面，實作則根據不同瀏覽器有不同的 Driver

其中 Protractor、Selenium、NightWatch 都是基於 WebDriver API 實作的

### 結論

我覺得 Cypress 最好用、最有助於開發。因此本篇文章會多著墨於 Cypress，其他則是簡單帶過

如果對其他框架沒興趣，這篇文章可以只看 Cypress 以及文末的 B2B 實際範例

## Cypress

### 分析

**優**

1. 非常詳細的文件說明，且每個說明頁都附上影片
2. 內建許多測試範例，範例同時具有每一步快照、程式碼。把範例看完就幾乎等於會使用 Cypress
3. 優美易用的 UI
4. 每一步測試都有快照，有助於開發與 Debug

**缺**

1. 目前只支援基於 Chromium 的瀏覽器，目前僅限 Chrome、Edge、Electron

### 說明

**安裝**

NPM

```shell
npm install cypress --save-dev
```

Yarn

```shell
yarn add cypress --dev
```

**開啟**

```shell
npx cypress open
```

會看到一個介面，內建許多測試範例，點擊即可執行測試。其餘管理都可以透過介面操作

<img src="images\cypress2.png" />



這是打開測試範例的測試介面，會另開一個瀏覽器執行給你看。範例使用的都是他們自己的網站，除了要測試的 UI 元件之外也附上程式碼。搭配這個測試的程式碼以及每一步的快照，看範例就像在讀文件一樣，非常清楚。

<img src="images\cypress3.png" />



將滑鼠移動到左方的測試步驟上，右方的測試介面就會顯示 before、after，顯示這一步的執行前後差異

<img src="images\cypress4.gif" />

**範例**

```javascript
// Google.js

it('搜尋', () => {
  // 前往Google搜尋網頁
  cy.visit('https://www.google.com/?hl=zh_tw')

  // 找到輸入框輸入 'YouTube'
  // 同時驗證輸入框是否真的有 'YouTube' 這個值
  cy.get('[name=q]')
    .type('YouTube').should('have.value', 'YouTube')

  // 找到搜尋按鈕按下
  // 使用.first()的原因在於name=btnK的元素有2個
  cy.get('[name=btnK]').first().click()
  
  // 取得網頁標題 同時驗證應該等於 'YouTube - Google 搜尋'
  cy.title().should('eq', 'YouTube - Google 搜尋')
})
```

**執行**

透過 UI 操作即可，若要跑在 Console，則使用以下指令。

```shell
# 執行指定測試
npx cypress run --spec "project/testFile.js"

# 執行目錄底下所有測試
npx cypress run --spec "project/**"
```

由於預設瀏覽器是 Electron，因此加個參數改為使用 Chrome

```shell
# 指定使用Chrome測試
npx cypress run --browser chrome --spec "project/**"

# 使用headless模式測試
npx cypress run --headless --browser chrome --spec "project/**"
```

**執行畫面**

<img src="images\cypress.png" />

### 自動錄製

去 Chrome 下載擴充功能 [Cypress Recorder](https://chrome.google.com/webstore/detail/cypress-recorder/glcapdcacdfkokcmicllhcjigeodacab/related)

打開想要測試的頁面，然後開啟 Cypress Recorder，按下 Start Recording

<img src="images\cypress4.png" />

執行你想要測試的操作，結束後再次打開 Cypress Recorder

可以看到已經將你的操作側錄下來並且轉成程式碼，至於 Assert 部分則會自動幫你填入。當然，不見得是你要的，但是操作的部分應該沒問題

<img src="images\cypress5.png" />

按下 Stop Recording 即可將程式碼複製下來 (Copy to Clipboard)

<img src="images\cypress6.png" />



透過側錄得到的程式碼不見得是你完全要的，但錄製完後拿來編修還是很有效率的，至少操作過程不需每一行都手寫，透過 Recorder 可以有效加速開發速度。

### 報表產出

除了透過文字命令看到的測試結果外，也可透過內建功能產出 xml 格式檔案報表。如果覺得內建的測試結果不夠用，需要產出報表的話，可以透過 [Mochawesome](https://github.com/adamgruber/mochawesome)

**安裝**

```shell
npm install --save-dev mochawesome mochawesome-merge mochawesome-report-generator
```

**準備**

在專案目錄新增檔案 cypress.json

```json
{
  "reporter": "mochawesome",
  "reporterOptions": {
    "reportDir": "cypress/results",
    "overwrite": false,
    "html": false,
    "json": true
  }
}
```

**執行**

這會執行所有測試，並且將 json 格式測試報告產出在指定目錄 cypress/results 底下

```shell
cypress run --reporter mochawesome
```

當然也可以搭配其他指令，產出指定測試的報表

```shell
npx cypress run --reporter mochawesome --spec "project/testFile.js"
```



產出的 json 報告會根據不同測試檔案而產出多個檔案

```
cypress/results/mochawesome.json, cypress/results/mochawesome_001.json, ...
```

透過指令將所有 json 檔案合併在一起

```shell
npx mochawesome-merge ./cypress/results/*.json -o output.json
```

將合併後的 json 檔解析成 html

```shell
npx marge mochawesome.json
```

<img src="images\cypress7.gif" />



<font color=#ff0000>**注意**</font>：透過 Cypress 官方網站文件指令產出的 json 會無法解析成 html，這似乎是 Windows 才有的 Bug。觀看官方文件時需特別注意。新指令是我去看套件的 GitHub 查到的。

```shell
# 舊指令
npx mochawesome-merge "cypress/results/*.json" > mochawesome.json
```

```shell
# 錯誤訊息
✘ Some files could not be processed:
mochawesome.json
  Unexpected token � in JSON at position 0
```

GitHub 上相關的 Issues

[Incorrect JSON coding format after mochawesome-merge #5103](https://github.com/cypress-io/cypress/issues/5103)

[Incorrect JSON coding format after mochawesome-merge #5111](https://github.com/cypress-io/cypress/issues/5111)

## Cypress 進階技巧

### Config 設定 - Base Url

cypress.json 就是 Cypress 的 config 檔，就算沒使用額外套件也可以拿來做一些設定

例如說 baseUrl，可以將基本的 url 寫入，日後寫測試程式碼就可以省略那一段

**cypress.json**

```json
{
"baseUrl": "http://localhost:1234/Web/",
}
```

**測試檔.js**

```javascript
context('B2B測試', () => {
  cy.visit('/') // 前往 baseUrl，不過這個網址沒東西可以看，所以進不去
  cy.visit('/B2B_B2ELogin') // 前往登入頁，可直接省略前面的 baseUrl
  cy.visit('ProductManager?e=1') // 前往商品提報頁
})
```

這個好處在於 Cypress 可以設定多個不同環境的 config 檔案。例如：Development、QA、Staging、Production

分別填入不同的 baseUrl 而測試程式碼只要填測試功能頁的網址即可，一套程式碼可以套用到所有環境上

### 檔案上傳

在 B2B 商品提報頁有上傳商品圖的功能，這可以透過 [cypress-file-upload](https://www.npmjs.com/package/cypress-file-upload) 達成

**安裝**

```shell
npm install --save-dev cypress-file-upload
```

**設定**

打開 cypress/support/commands.js 並加入一行

```javascript
import 'cypress-file-upload';
```

這樣就可以開始使用這個套件的擴充語法了

以 B2B 商品提報上傳圖片為例，先將圖片放入 cypress\fixtures 並分別命名為 TestMainImage.png, TestContentImage.png

使用 attachFile 語法上傳圖片

```javascript
// 上傳商品主圖
cy.get('#picUpload').attachFile('TestMainImage.png')
	  
// 上傳商品介紹圖
cy.get('#contentPicUpload').attachFile('TestContentImage.png')
```

## Protractor

### 分析

**優**

1. 一開始是針對 Angular 設計的 E2E 框架，由 Google 維護

**缺**

1. GitHub 上長時間沒有更新，最近的更新是支援新版 TypeScript，似乎對社群的 Issues 實現較少
2. 對於非 Angular 的頁面，需加上設定，否則程式碼會寫得很冗長

### 說明

**安裝**

```shell
npm install -g protractor
webdriver-manager update
```

**準備**

先將 WebDriver 打開

```shell
webdriver-manager start
```

執行測試至少需要 2 個檔案，設定檔 conf.js 以及測試檔案

```javascript
// conf.js

exports.config = {
  framework: 'jasmine',
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['spec.js']
}
```

``` javascript
// spec.js

it('搜尋', function() {
  // 如果不是Angular頁面則必須寫這行，否則程式碼須寫得很長
  browser.waitForAngularEnabled(false);
	
  browser.get('https://www.google.com/?hl=zh_tw');
	
  element(by.name('q')).sendKeys('YouTube');

  // 這邊會跳提示說有2個元素，Protractor會自動使用第1個而非報錯
  element(by.name('btnK')).click();

  expect(browser.getTitle()).toEqual('YouTube - Google 搜尋');
 });
```

**執行**

```shell
protractor conf.js
```

**Headless 模式**

需在 conf.js 加入設定

```javascript
// conf.js

exports.config = {
  framework: 'jasmine',
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['spec.js'],
  
  // 多了以下這段
  capabilities: {
  browserName: 'chrome',

  chromeOptions: {
     args: [ "--headless"]
   }
  }
}
```

**非 Angular 頁面測試**

如前面範例所述，加上一行就可以了。但如果不加那一行，會需要寫得很冗長

```javascript
// spec.js

it('搜尋', function() {
  // browser.waitForAngularEnabled(false);
    
  browser.driver.get('https://www.google.com/?hl=zh_tw');
	
  browser.driver.findElement(by.name('q')).sendKeys('YouTube');

  browser.driver.findElement(by.name('btnK')).click();

  expect(browser.driver.getTitle()).toEqual('YouTube - Google 搜尋');
 });
```

**執行畫面**

記得要先另開視窗執行 WebDriver

<img src="images\protractor.png" />

## Selenium

### 分析

**優**

1. 支援多種語言開發，如 JavaScript、Java、C#、Python、R 等……
2. 支援多種瀏覽器測試，如 Chrome、Firefox、IE、Safari、Opera 等……
3. 擁有強大的管理工具 Selenium Grid，可以將測試分散給不同機器執行以增加速度，也可針對不同機器執行不同瀏覽器測試
4. 支援多瀏覽器同時執行測試

**缺**

1. 以 JavaScript 以外的語言開發測試時，不便管理瀏覽器的核心版本。以 C# 為例，透過 NuGet 抓取核心會有更新太慢的問題
2. 沒有內建的 Assert ，需使用 Node.js 內建的 Assert 來做判斷。只有 Assert 出錯了才會報錯，看不到有多少測試、通過幾個、失敗幾個
3. 似乎較鼓勵使用 JavaScript 以外的語言撰寫，對 JavaScript 的撰寫不友善

### 說明

**安裝**

```shell
npm install selenium-webdriver
```

**準備**

下載想要測的瀏覽器的 Driver，這裡用 Chrome 做示範

[ChromeDriver 下載](https://sites.google.com/a/chromium.org/chromedriver/downloads)

將下載來的 Driver 放到與測試檔案同個目錄底下，或是[設置環境變數](https://www.selenium.dev/documentation/en/webdriver/driver_requirements/)也可以



測試檔案

```javascript
// Google.js

const {Builder, By, Key, until} = require('selenium-webdriver');
(async function example() {
    let driver = await new Builder().forBrowser('chrome').build();
    try {
        await driver.get('https://www.google.com/?hl=zh_tw');

        await driver.findElement(By.name('q')).sendKeys('YouTube', Key.ENTER);

        var title = await driver.getTitle();;

		const assert = require("assert");
		assert.equal('YouTube - Google 搜尋', title);
    }
    finally{
        driver.quit();
    }
})();
```

**執行**

```shell
# node 檔名
node Google
```

**執行畫面**

沒有任何報告產出

<img src="images\selenium.png" />

## Nightwatch

### 分析

**缺**

1. 語法較其他測試框架不同，需重新適應

### 說明

**安裝**

```shell
npm install nightwatch --save-dev
npm install selenium-server --save-dev
```

**準備**

創建 config 檔案

```javascript
// nightwatch.conf.js

module.exports = {
  // An array of folders (excluding subfolders) where your tests are located;
  // if this is not specified, the test source must be passed as the second argument to the test runner.
  src_folders: [],

  webdriver: {
    start_process: true,
    port: 4444,
    server_path: require('chromedriver').path,
    cli_args: [
    ]
  },

  test_settings: {
    default: {
      launch_url: 'https://nightwatchjs.org',
      desiredCapabilities : {
        browserName : 'chrome',
      }
    }
  }
};
```

**範例**

```javascript
// Google.js

module.exports = {
  '搜尋' : function(browser) {
    browser
      .url('https://www.google.com/?hl=zh_tw')
      .waitForElementVisible('body')
      .assert.visible('input[name=q]')
      .setValue('input[name=q]', 'YouTube')
      .assert.visible('input[name=btnK]')
      .click('input[name=btnK]')
      .assert.titleContains('YouTube - Google 搜尋')
      .end();
  }
};
```

**執行**

```shell
npm test Google.js
```

```shell
# 內建測試範例
npm test ./node_modules/nightwatch/examples/tests/ecosia.js
```

**執行畫面**

<img src="images\nightwatch.png" />

## B2B 實際範例

### 網路商品提報—欄位填寫

我們先思考一下，該怎麼進入測試頁？為什麼要思考？因為在進入這個提報頁之前，需要先經過**登入**這一步。那難道我們測試每個功能、每個頁面之前都要先跑一次登入嗎？

沒錯，每次都要登入，<font color=#ff0000>但不必透過 UI 來登入</font>。

許多測試框架都可以使用 Hooks，就是在測試前/後要執行什麼步驟。我們在進入測試頁前先執行一次登入，就可以進入測試頁開始測試了

使用 beforeEach 在每個測試前都先執行登入，至於怎麼執行？只要看我們的程式碼直接找到進入點並且 POST 資料進去就可以了

```javascript
beforeEach(() => {
	cy.request('POST', 'http://localhost:1234/Web/B2B_B2ELogin/LoginValidation', {
      userName: '12718372',
      paw: '123456'
    })
  })
```



這樣就搞定每個頁面的事前登入了，接者要寫想測試的程式碼

由於這邊我想單純測試欄位的填寫是否正常，因此我會在這個頁面分出一個群組出來，使用 describe 語法來達成。並且再次使用 beforeEach 進入測試頁

```javascript
describe('網路商品提報-欄位填寫', () => {	
	beforeEach(() => {	
	  cy.visit('http://localhost:1234/Web/ProductManager?e=1')
  })
    
  // 測試程式碼...
})
```



再介紹一個分組用的語法 context，我會在最外層使用 context 並且執行登入，然後在每個要測試的模組中使用 describe 來分組，並且前往指定的測試頁

```javascript
/// <reference types="cypress" />

context('B2B測試', () => {
  beforeEach(() => {
	cy.request('POST', 'http://localhost:1234/Web/B2B_B2ELogin/LoginValidation', {
      userName: '12718372',
      paw: '123456'
    })
  })

  
  describe('網路商品提報-欄位填寫', () => {	
	beforeEach(() => {	
	  cy.visit('http://localhost:1234/Web/ProductManager?e=1')
    })
      
    // 測試程式碼...
  })

  describe('某個功能測試', () => {	
	beforeEach(() => {	
	  cy.visit('某個功能頁網址')
    })
      
    // 測試程式碼...
  })
})

```



開始撰寫測試時，使用 it 語法來為這個測試命名、撰寫

```javascript
it('測試標題', () => {
  // 測試程式碼...
})
```



這邊我想測試銷售名稱是否能正確輸入，可以輸入後再檢查超過字數時是否會正常跳出警示

步驟如下：

1. 找到銷售名稱的輸入框
2. 輸入 "Cypress測試銷售名稱"，並驗證其值
3. 檢查超過字數的警示視窗，此時應該不存在
4. 刪除原先標題，輸入大量文字使其超過字數限制
5. 使滑鼠在這個輸入框失焦，以觸發檢查字數限制
6. 檢查超過字數的警示視窗，此時應該存在
7. 再次刪除標題
8. 輸入 "Cypress測試銷售名稱"，並驗證其值
9. 使滑鼠在這個輸入框失焦，以觸發檢查字數限制
10. 檢查超過字數的警示視窗，此時應該不存在

```javascript
it('銷售名稱', () => {
	  cy.get('[id=saleName]')
	    .type('Cypress測試銷售名稱').should('have.value', 'Cypress測試銷售名稱')

      // 這是超過字數時會跳出的警示視窗的 class
      // 用 should('not.exist') 來驗證此時視窗應該不存在
      cy.get('[class=formErrorContent]').should('not.exist')

      // {selectall} 是全選, {del} 是刪除
      // 這邊將剛剛輸入的銷售名稱刪除 並且大量輸入字數直到超過限制
      // 再使用 .blur() 使滑鼠失焦，這樣才能觸發我們頁面上的字數驗證
      cy.get('[id=saleName]')
        .type('{selectall}{del}')
        .type('!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!').blur()

      // 此時超過字數的警示視窗應該出現
      cy.get('[class=formErrorContent]').should('be.visible')

      // 再將超過字數的標題刪除 並重新輸入正常標題
      cy.get('[id=saleName]')
        .type('{selectall}{del}Cypress測試銷售名稱').blur()

      // 超出字數的警示視窗應該消失了
      cy.get('[class=formErrorContent]').should('not.exist')
    })
```

當然了，這個測試情境我設計得稍微繁複與仔細，這是為了測試足夠完全，所以步驟稍微多了點



**完整程式碼**

```javascript
context('B2B測試', () => {
  beforeEach(() => {
	cy.request('POST', 'http://localhost:1234/Web/B2B_B2ELogin/LoginValidation', {
      userName: '12718372',
      paw: '123456'
    })
  })
    
  describe('網路商品提報-欄位填寫', () => {	
	beforeEach(() => {	
	  cy.visit('http://localhost:1234/Web/ProductManager?e=1')
	  
	  cy.get('[id=formTitle]>span:first>strong:first').should('contain', '網路商品')
  })
	
    it('銷售名稱', () => {
	  cy.get('[id=saleName]')
	    .type('Cypress測試銷售名稱').should('have.value', 'Cypress測試銷售名稱')

      cy.get('[class=formErrorContent]').should('not.exist')

      cy.get('[id=saleName]')
        .type('{selectall}{del}')
        .type('!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!').blur()

      cy.get('[class=formErrorContent]').should('be.visible')

      cy.get('[id=saleName]')
        .type('{selectall}{del}Cypress測試銷售名稱').blur()

      cy.get('[class=formErrorContent]').should('not.exist')
    })   
    
  })
  
})
```



**執行畫面**

<img src="images\cypress8.gif" />

### 同性質功能該不該分開寫？

以「測試輸入框」為例，測試 B2B 商品提報的時候應該分開撰寫嗎？這樣優點、缺點在哪？

以下這個範例檔案，測試了：

1. 銷售名稱
2. 銷售副標
3. 價格

```javascript
/// <reference types="cypress" />

context('B2B測試', () => {
  beforeEach(() => {
	cy.request('POST', 'http://localhost:1234/Web/B2B_B2ELogin/LoginValidation', {
      userName: '12718372',
      paw: '123456'
    })
  })

  describe('網路商品提報-欄位填寫', () => {	
	beforeEach(() => {	
	  cy.visit('http://localhost:1234/Web/ProductManager?e=1')
	  
	  cy.get('[id=formTitle]>span:first>strong:first').should('contain', '網路商品')
  })
	
    it('銷售名稱', () => {
	  cy.get('[id=saleName]')
	    .type('Cypress測試銷售名稱').should('have.value', 'Cypress測試銷售名稱')

      cy.get('[class=formErrorContent]').should('not.exist')

      cy.get('[id=saleName]')
        .type('{selectall}{del}')
        .type('!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!').blur()

      cy.get('[class=formErrorContent]').should('be.visible')

      cy.get('[id=saleName]')
        .type('{selectall}{del}Cypress測試銷售名稱').blur()

      cy.get('[class=formErrorContent]').should('not.exist')
    })
	
	it('銷售副標', () => {
      cy.get('[id=salesSubtitle]')
        .type('Cypress測試銷售副標').should('have.value', 'Cypress測試銷售副標')

      cy.get('[class=formErrorContent]').should('not.exist')

      cy.get('[id=salesSubtitle]')
        .type('{selectall}{del}')
        .type('!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!超過字數測試!!!!!').blur()

      cy.get('[class=formErrorContent]').should('be.visible')

      cy.get('[id=salesSubtitle]')
        .type('{selectall}{del}Cypress測試銷售副標').blur()

      cy.get('[class=formErrorContent]').should('not.exist')
	})
      
    it('價格', () => {
      cy.get('[id=marketPrice]')
        .type('1200').should('have.value', '1200')

      cy.get('[id=salePrice]')
        .type('1000').should('have.value', '1000')

      cy.get('[id=costPrice]')
        .type('600').should('have.value', '600').blur()

      cy.get('[id=grossMarginText]').contains('400(含稅)')
	  
	  cy.get('[id=grossProfitText]').contains('40.00%(含稅)')
	})
      
  })

})
```



這個檔案 Cypress 執行的時候會是以下流程

1. 進入 context，執行最外層 beforeEach 的登入
2. 進入 describe 的網路商品提報-欄位填寫
3. 執行這一層 beforeEach 的前往指定頁面
4. 執行 "銷售名稱" 測試

每一個測試都會重複以上 4 步，也就是說，光是欄位的輸入我分開寫的話，這樣就已經要重複登入、跳轉頁面 3 次之多

那如果每個地方的輸入框都分開寫，到時候可能要重複執行數 10 次的登入與跳轉，整個 B2B 功能繁多，要是這些動作重複了上百次，會造成時間上的浪費

也許我可以將輸入框的部分全部寫在一支測試就叫「輸入框測試」，並且將所有能輸入的輸入框一次跑完就好

但是這樣的壞處在於只要有一個地方出錯，測試馬上會停下來，後面的測試將不再執行。也許沒壞的功能就不會被測試到了



**合併寫**

**優**

1. 不需再重複執行大量登入、頁面跳轉

**缺**

1. 若某功能出錯，則整個測試會停下，需要花時間釐清錯在哪



**分開寫**

**優**

1. 測試什麼功能、失敗在哪會非常明確

**缺**

1. 大量的重複登入、頁面跳轉



以我個人的看法而言，我偏向分開寫，但是 B2B 功能太過複雜，若全面的測試都撰寫完畢，那全部測試起來可能會有極大的浪費，不過還沒寫完也不知道

我認為可以兩者折衷，例如此例中，就可以將銷售名稱、銷售副標歸類在同一個測試中

## 參考

[什麼是Selenium WebDriver ?](https://matthung0807.blogspot.com/2017/12/selenium-webdriver.html)

[Comparison between Selenium, Protractor, Cypress, and WebdriverIO](https://medium.com/@sahil.goyal2/comparison-between-selenium-protractor-cypress-and-webdriverio-7786fc90ee09)

[鼠年全馬鐵人挑戰 WEEK 10：Selenium Grid](https://ithelp.ithome.com.tw/articles/10230231)

[how to use Protractor on non angularjs website?](https://stackoverflow.com/questions/20927652/how-to-use-protractor-on-non-angularjs-website)

[cypress-file-upload](https://www.npmjs.com/package/cypress-file-upload)