class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USERNAME"],
  password: ENV["HTTP_BASIC_PASSWORD"],
  if: -> { ENV["HTTP_BASIC_PASSWORD"].present? }
 
  protect_from_forgery with: :exception
  
  def show
    @productsCount = Product.count
    @categoriesCount = Category.count
  end
end
