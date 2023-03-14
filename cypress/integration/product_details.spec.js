describe('product descriptions page', () => {

  it("should visit the homepage after logging in", () => {
    // visit the login page
    cy.visit("/", { failOnStatusCode: false });
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should click on first product", () => {
    cy.get(':nth-child(1) > a > img').click()
    cy.get("article").should("be.visible");
    });
});