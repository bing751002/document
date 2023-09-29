it('搜尋', () => {
  // 前往Google搜尋網頁
  cy.visit('https://www.google.com/?hl=zh_tw')

  // 找到輸入框輸入 'YouTube'
  cy.get('[name=q]')
    .type('YouTube').should('have.value', 'YouTube')

  // 找到搜尋按鈕按下
  // 使用.first()的原因在於name=btnK的元素有2個
  cy.get('[name=btnK]').first().click()
  
  // 取得網頁標題 應該等於 'YouTube - Google 搜尋'
  cy.title().should('eq', 'YouTube - Google 搜尋')
})