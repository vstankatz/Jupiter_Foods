require 'rails_helper'
describe "product deletion" do
  before :each do
    @product = Product.create({:name => "Apple Butter", :origin => "USA", :cost => 2.34})
  end
  it "deletes a product" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    check 'user[admin]'
    click_on 'Sign up'
    visit product_path(@product)
    click_on 'Delete product'
    expect(page).to_not have_content "Apple Butter"
  end

  it "does not allow a non admin user to delete a product" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    check 'user[admin]'
    visit product_path(@product)
    expect(page).to_not have_content "Delete product"
  end
end
