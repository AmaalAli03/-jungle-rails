

describe("Visiting the homepage", () => {
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
  });