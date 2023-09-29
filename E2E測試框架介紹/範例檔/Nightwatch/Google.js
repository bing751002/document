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