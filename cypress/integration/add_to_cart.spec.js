describe('add to cart', () => {
  before(() => {
    cy.visit("/")
  })

  it('cart count changes when item added', () => {
    cy.get("button").contains('Add').click({force: true})

    cy.get("a").contains(" My Cart (1) ").should("be.visible");
  })
})