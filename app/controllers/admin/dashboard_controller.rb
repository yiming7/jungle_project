class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.all.size
    @categories_count = Category.all.size
  end
end
