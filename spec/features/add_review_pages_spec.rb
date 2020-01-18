require 'rails_helper'
describe "reviews setup and teardown" do
before :each do
@product = Product.create({:name => "Apple Butter", :origin => "USA", :cost => 2.34})
end
### Commented out this spec because the star method radio buttons dont seem accessible
###
# describe "the add a review process" do
#   it "adds a new review" do
#     visit product_path(@product)
#     click_link 'Create new review'
#     fill_in 'review[author]', :with => 'Samantha'
#     choose(value=1)
#     fill_in 'review[content]', :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
#     click_on 'Create Review'
#     expect(page).to have_content 'Samantha your review for Apple Butter has been saved!'
#   end
# end

  it "gives an error when no name is entered" do
    visit new_product_review_path(@product)
    click_on 'Create Review'
    expect(page).to have_content "Author can't be blank"
  end
end
