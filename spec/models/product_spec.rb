require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do 
    @category = Category.create(name: "Shrubs")
    @product = Product.create(name: "Snakeplant", price_cents: 77, quantity: 7,category: @category)
  end


  it "is valid with valid attributes" do
    expect(@product).to be_valid
  end

  it "is not valid without a name" do
    @product.name = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Name can't be blank")
  end

  it "is not valid without a price" do
    @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price cents is not a number")
   end 

 it "is not valid without a quantity" do
    @product.quantity = nil
    expect(@product).to_not be_valid 
    expect(@product.errors.full_messages).to include("Quantity can't be blank")
  end 

  it "is not valid without a category" do
    @product.category = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Category must exist")
  end 
  
  
end
