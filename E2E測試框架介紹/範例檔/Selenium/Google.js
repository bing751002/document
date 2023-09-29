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