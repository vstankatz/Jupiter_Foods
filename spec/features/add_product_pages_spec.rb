require 'rails_helper'

describe "the add a product process as an admin" do
  it "adds a new product" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    check 'user[admin]'
    click_on 'Sign up'
    visit products_path
    click_link 'Create new product'
    fill_in 'product[name]', :with => 'Apple Butter'
    fill_in 'product[origin]', :with => 'United State of America'
    fill_in 'product[cost]', :with => '3'
    click_on 'Create Product'
    expect(page).to have_content 'Apple Butter'
  end

  it "gives an error when no name is entered" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    check 'user[admin]'
    click_on 'Sign up'
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end

describe "the add a product process as a user" do
  it "attempt to add a new product" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    click_on 'Sign up'
    visit new_product_path
    expect(page).to have_content "You aren't authorized to perform that action."
  end

  it "gives an error when you're not signed in" do
    visit new_product_path
    expect(page).to have_content "Please sign-in to continue."
  end
end
