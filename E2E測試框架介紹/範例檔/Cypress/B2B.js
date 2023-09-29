/// <reference types="cypress" />

context('B2B測試', () => {
  beforeEach(() => {
	cy.request('POST', 'http://localhost:1234/Web/B2B_B2ELogin/LoginValidation', {
      userName: '12718372',
      paw: '123456'
    })
  })

  describe('登入、登出', () => {	
    it('登入', () => {
	  // 由於每個測試前都先登入了，因此這邊先呼叫登出
	  cy.request('POST', 'http://localhost:1234/Web/B2B_B2ELogin/LoginOut')
      
	  cy.visit('http://localhost:1234/Web/B2B_B2ELogin')
      cy.url().should('eq', 'http://localhost:1234/Web/B2B_B2ELogin')
	  
	  cy.get('[id=txtUserName]')
        .type('12718372').should('have.value', '12718372')
	  
	  cy.get('[id=txtPassWord]')
        .type('123456').should('have.value', '123456')
	  
	  cy.get('[id=checkIdentityButton]').click()
	
	  cy.get('.btn.btn-primary.btn-lg', { timeout: 10000 }).should('be.visible')
	  
	  cy.visit('http://localhost:1234/Web/DefaultPage')
	  
	  cy.url().should('eq', 'http://localhost:1234/Web/DefaultPage')
	})
	
	it('登出', () => {
	  cy.visit('http://localhost:1234/Web/DefaultPage')
	  cy.url().should('eq', 'http://localhost:1234/Web/DefaultPage')
	  
	  cy.request('POST', 'http://localhost:1234/Web/B2B_B2ELogin/LoginOut')
      
	  cy.visit('http://localhost:1234/Web/B2B_B2ELogin')
	  cy.url().should('eq', 'http://localhost:1234/Web/B2B_B2ELogin')
	})
  })
  
  describe('網路商品提報', () => {	
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
	
	it('材積填寫', () => {
	  // 包裝長
      cy.get('#txtLength')
	    .type('!!!').blur()
		
	  // 寬
      cy.get('#txtWidth')
	    .type('@@@').blur()
		
	  // 高
      cy.get('#txtHeight')
	    .type('###').blur()
		
	  // 重量
      cy.get('#txtWeight')
	    .type('測試').blur()
	
	  // 應該有4個警示視窗
	  cy.get('[class=formErrorContent]')
	    .should('have.length', 4)

	  cy.get('#txtLength')
	    .type('{selectall}{del}123').should('have.value', '123')
	  cy.get('#txtWidth')
	    .type('{selectall}{del}456').should('have.value', '456')
	  cy.get('#txtHeight')
	    .type('{selectall}{del}789').should('have.value', '789')
	  cy.get('#txtWeight')
	    .type('{selectall}{del}123').blur().should('have.value', '123')
	})
	
	it('顏色尺寸規格', () => {
	  // 廠商料號
	  cy.get('#fugoProductPN0')
	    .type('Test').should('have.value', 'Test')

      // 國際條碼
	  cy.get('[ng-model="pan.EANcode"]')
	    .first()
		.type('!@#$%%^^').blur()

      // 國際條碼警示
      cy.get('[class=formErrorContent]').should('contain', '* 只能填數字')

      cy.get('[ng-model="pan.EANcode"]')
	    .first()
	    .type('{selectall}{del}1234').blur()
	  
	  // 國際條碼警示
      cy.get('[class=formErrorContent]').should('contain', '* 最少 8 個字元,且不可有特殊字元')
	  
	  // 輸入特殊字元時 2個警示訊息都會出現
	  cy.get('[ng-model="pan.EANcode"]')
	    .first()
	    .type('{selectall}{del}!!!!').blur()
	  
	  cy.get('[class=formErrorContent]').should('contain', '* 只能填數字')
	                                    .should('contain', '* 最少 8 個字元,且不可有特殊字元')
	  
	  cy.get('[ng-model="pan.EANcode"]')
	    .first()
	    .type('{selectall}{del}12345678').blur()
	  
      // 備貨量
      cy.get('[ng-model="pan.num_e"]')
	    .type('-10');

      // 備貨量警示
      cy.get('[class=formErrorContent]').should('contain', '* 只能填數字')
	  
      cy.get('[ng-model="pan.num_e"]')
	    .type('{selectall}{del}100').should('have.value', '100')
		
	  //////////////////////
	  // 以下為保留字檢查 //
	  //////////////////////
	  const typeReservedWords = (dom) => {
		  cy.get(dom)
	        .type('共同').blur()
	      // 確認保留字警示視窗有出現 並且點掉
          cy.get('.swal2-confirm').should('exist')
	        .click()
	  
	      cy.get(dom)
	        .type('{selectall}{del}公用').blur()

          cy.get('.swal2-confirm').should('exist')
	        .click()
		
	      cy.get(dom)
	        .type('{selectall}{del}共用').blur()

          cy.get('.swal2-confirm').should('exist')
	        .click()
		
	      cy.get(dom)
	        .type('{selectall}{del}索取尺寸卡＊').blur()

          cy.get('.swal2-confirm').should('exist')
	        .click()
		
	      cy.get(dom)
	        .type('{selectall}{del}索取尺寸卡').blur()

          cy.get('.swal2-confirm').should('exist')
	        .click()
	  }
      // 只有顏色
      cy.get('.layout-row > .pure-radiobutton:nth-child(3) > label').click()
	  
	  typeReservedWords('#colorCol0')

	  // 只有款式
      cy.get('.layout-row > .pure-radiobutton:nth-child(4) > label').click()
	 
      typeReservedWords('#styleCol0')

	  
	  // 款式 + 顏色
      cy.get('.layout-row > .pure-radiobutton:nth-child(5) > label').click()
	  
	  typeReservedWords('#colorCol0')
	  
	  typeReservedWords('#styleCol0')
	})
	
	it('圖片上傳', () => {
      // 上傳商品主圖
      cy.get('#picUpload').attachFile('TestMainImage.png')
	  
	  // 上傳商品介紹圖
	  cy.get('#contentPicUpload').attachFile('TestContentImage.png')
	  
	  // 看商品主圖是否存在
	  // 由於圖片沒有給予ID等特殊資訊，因此用Click的觸發動作去搜尋，這是不得已而這樣寫
	  // 至於用 have.length 不用should('exist')是保留未來想上傳多張圖測試的彈性
	  cy.get('img[ng-click="ImgPreviewPageShow($index);"]').should('have.length', 1)
	  
	  // 看商品介紹圖是否存在
	  cy.get('[class=imgHiddenWall]').should('have.length', 1)
	})
    
	it('說明欄位填寫', () => {
      cy.get('#prdDesPlanner').click().blur()
	  cy.get('#productSpec').click().blur()
	  cy.get('#attentionItem').click().blur()
	  cy.get('#presentDescription').click().blur()
	  cy.get('#accessory').click().blur()
	  cy.get('#useMethod').click().blur()
	  cy.get('#patentNo').click().blur()
	  
	  // 必填欄位應該有4個
	  cy.get('[class=formErrorContent]')
	    .should('have.length', 4)

      // 我不知道iframe編輯器怎麼處理，抓得到但輸入不了，用滑鼠強制點座標的方式也沒辦法。但不是必填就先跳過了
      // cy.get('iframe[title="RTF 編輯器, editor_kama"]').type('商品介紹')
	  cy.get('#prdDesPlanner').type('短敘述').should('have.value', '短敘述')
	  cy.get('#productSpec').type('規格說明').should('have.value', '規格說明')
	  cy.get('#attentionItem').type('注意事項說明').should('have.value', '注意事項說明')
	  cy.get('#presentDescription').type('贈品說明').should('have.value', '贈品說明')
	  cy.get('#accessory').type('配件說明').should('have.value', '配件說明')
	  cy.get('#useMethod').type('使用方法說明').should('have.value', '使用方法說明')
	  cy.get('#patentNo').type('相關字號&專利').should('have.value', '相關字號&專利')
	})
    
  })
  
  
  
  
  
  

})
