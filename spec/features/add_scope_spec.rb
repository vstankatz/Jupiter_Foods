require 'rails_helper'

describe "it views the products page through different scopes" do
it 'should scope based off local' do
  visit '/'
  click_link 'Sign-In/Sign-Up'
  click_link 'Sign up'
  fill_in 'user[email]', :with => 'test@epicodus.com'
  fill_in 'user[password]', :with => 'password'
  fill_in 'user[password_confirmation]', :with => 'password'
  check 'user[admin]'
  click_on 'Sign up'
  visit products_path
  select('Made in the USA', from: 'scope')
  expect(page).to have_content 'No products to display.'
end

# it 'should scope based off most reviews' do
#
# end
#
# it 'should scope based off most recently added' do
#
# end
end
