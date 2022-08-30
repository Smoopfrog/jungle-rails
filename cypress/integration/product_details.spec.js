describe('product page', () => {
  before(() => {
    cy.visit("/")
  })

  it('displays the product page', () => {
    cy.get(".products article")
      .first()
      .click()
    
    cy.get('.page-header h1').should('be.visible')
    cy.get('.quantity span').first().should('have.text', '18 in stock at ')
  })
})