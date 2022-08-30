describe('User login', () => {
  before(() => {
    cy.visit("/")
  });

  it("should enter email and password at login", () => {
		cy.visit("/login");

		cy.get("input[name='email']").type("test@email.com");
		cy.get("input[name='password']").type("12345678");
		cy.get("input[name='commit']").click({ force: true });

		cy.get("a").contains("Logout").should("be.visible");
	});

})