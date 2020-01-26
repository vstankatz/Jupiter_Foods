require 'rails_helper'

describe "scopes setup and teardown" do
before :each do
user = User.create(email: 'cool@cat.com', password: 'testing', admin: true)
@product = Product.create({:name => "Apple Butter", :origin => "USA", :cost => 2.34, user_id: user.id})
Review.create!(author: 'Bilbo Baggins' , rating: 4, content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.' , product_id: @product.id, user_id: user.id)
end

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
  expect(page).to have_content 'Apple Butter'
end

it 'should scope based off most reviews' do
  visit '/'
  click_link 'Sign-In/Sign-Up'
  click_link 'Sign up'
  fill_in 'user[email]', :with => 'test@epicodus.com'
  fill_in 'user[password]', :with => 'password'
  fill_in 'user[password_confirmation]', :with => 'password'
  check 'user[admin]'
  click_on 'Sign up'
  visit products_path
  select('Most Reviews', from: 'scope')
  expect(page).to have_content 'Apple Butter'
end

# it 'should scope based off most recently added' do
#
# end
end

end
