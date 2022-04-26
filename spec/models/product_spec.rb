require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'ensures that a product will save properly' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: "this", price_cents: 233333, quantity: 2, category: category)
      expect(product).to be_valid
    end

    it 'should have valid name,price,quality,category' do
      category = Category.create(name: 'chair')
      product = Product.create(name: 'red chair',price_cents: 100, quantity: nil, category: category)

      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should have valid name,price,quality,category' do
      category = Category.create(name: 'chair')
      product = Product.create(name: 'red chair',price_cents: nil, quantity:5, category: category)

      expect(product.errors.full_messages).to include("Price cents can't be blank")
    end
  end
end