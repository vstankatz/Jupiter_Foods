require 'rails_helper'

describe "review editing" do

  before :each do
    user = User.create(email: 'cool@cat.com', password: 'testing', admin: true)
    @product = Product.create({:name => "Apple Butter", :origin => "USA", :cost => 2.34, user_id: user.id})
    @review = Review.create(author: 'Bilbo Baggins' , rating: 4, content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.' , product_id: @product.id, user_id: user.id)
end

  it "edits a review" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    check 'user[admin]'
    click_on 'Sign up'
    visit product_review_path(@product, @review)
    click_on 'Edit review'
    fill_in 'review[author]', :with => 'Samantha'
    find(id: 'star_3').click
    fill_in 'review[content]', :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut a."
    click_on 'Update Review'
    expect(page).to have_content 'Samantha'
  end

  # it "returns error when user tries to edit a product" do
  #   visit '/'
  #   click_link 'Sign-In/Sign-Up'
  #   click_link 'Sign up'
  #   fill_in 'user[email]', :with => 'test@epicodus.com'
  #   fill_in 'user[password]', :with => 'password'
  #   fill_in 'user[password_confirmation]', :with => 'password'
  #   click_on 'Sign up'
  #   visit edit_product_review_path(@review)
  #   expect(page).to have_content "You aren't authorized to perform that action."
  # end
  #
  # it "returns error non user tries to edit a product" do
  #   visit edit_product_review_path(@review)
  #   expect(page).to have_content "Please sign-in to continue."
  # end

end
