require 'rails_helper'

describe "product editing" do

  before :each do
    @product = Product.create({:name => "Apple Butter", :origin => "USA", :cost => 2.34})
  end

  it "edits a product" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    check 'user[admin]'
    click_on 'Sign up'
    visit product_path(@product)
    click_on 'Edit product'
    fill_in 'product[name]', :with => 'Peanut Butter'
    fill_in 'product[origin]', :with => 'United State of America'
    fill_in 'product[cost]', :with => '3'
    click_on 'Update Product'
    expect(page).to have_content 'Peanut Butter'
  end

  it "returns error when user tries to edit a product" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    click_on 'Sign up'
    visit edit_product_path(@product)
    expect(page).to have_content "You aren't authorized to perform that action."
  end

  it "returns error non user tries to edit a product" do
    visit edit_product_path(@product)
    expect(page).to have_content "Please sign-in to continue."
  end

end
