require 'rails_helper'

describe "review deletion" do

  before :each do
    user = User.create(email: 'cool@cat.com', password: 'testing', admin: true)
    @product = Product.create({:name => "Apple Butter", :origin => "USA", :cost => 2.34, user_id: user.id})
    @review = Review.create(author: 'Bilbo Baggins' , rating: 4, content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.' , product_id: @product.id, user_id: user.id)
end

  it "deletes a review" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    check 'user[admin]'
    click_on 'Sign up'
    visit product_review_path(@product, @review)
    click_on 'Delete review'
    expect(page).to_not have_content 'Bilbo Baggins'
  end

  it "does not allow a non admin user to delete a review" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    click_on 'Sign up'
    visit edit_product_review_path(@product, @review)
    expect(page).to_not have_content "Delete review"
  end

end
