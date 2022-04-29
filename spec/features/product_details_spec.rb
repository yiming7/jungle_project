require 'rails_helper'

RSpec.feature "Visitor clickes a product item", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click first product details" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    first('.product').click_on('Details')
    expect(page).to have_css('.product-detail')
    save_screenshot
  end

end