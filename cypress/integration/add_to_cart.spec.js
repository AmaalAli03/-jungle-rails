describe('adding item to cart', () => {

  it("should visit the homepage after logging in", () => {
    // visit the login page
    cy.visit("/", { failOnStatusCode: false });
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it('lets you click add to an available product to the cart and then checks that cart count also increases by 1', () => {
    cy.get('button.btn').first().click({force: true});
    cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(2) > .nav-link').should('contain', '1');
  });
    
  // it('lets you click add to an available product to the cart and then checks that cart count also increases by 1', () => {
  //   cy.contains('My Cart (0)')
    
  //   cy.contains('Add').first().click({force: true})

  //   cy.contains('My Cart (1)')
  // })

});