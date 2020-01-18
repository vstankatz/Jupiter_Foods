require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'product[name]', :with => 'Apple Butter'
    fill_in 'product[origin]', :with => 'USA'
    fill_in 'product[cost]', :with => 2.34
    click_on 'Create Product'
    expect(page).to have_content 'Apple Butter'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end
