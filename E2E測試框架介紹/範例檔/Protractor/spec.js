it('搜尋', function() {
  browser.waitForAngularEnabled(false);
	
  browser.get('https://www.google.com/?hl=zh_tw');
	
  element(by.name('q')).sendKeys('YouTube');

  element(by.name('btnK')).click();

  expect(browser.getTitle()).toEqual('YouTube - Google 搜尋');
 });