require 'rails_helper'
describe "reviews setup and teardown" do
before :each do
@product = Product.create({:name => "Apple Butter", :origin => "USA", :cost => 2.34})
end
### Commented out this spec because the star method radio buttons dont seem accessible
###
describe "the add a review process" do
  it "adds a new review" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    check 'user[admin]'
    click_on 'Sign up'
    visit product_path(@product)
    click_link 'Create new review'
    fill_in 'review[author]', :with => 'Samantha'
    find(id: 'star_3').click
    fill_in 'review[content]', :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut a."
    click_on 'Create Review'
    expect(page).to have_content 'Samantha your review for Apple Butter has been saved!'
  end
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
    visit new_product_review_path(@product)
    click_on 'Create Review'
    expect(page).to have_content "Author can't be blank"
  end

  it "gives an error when no rating is entered" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    check 'user[admin]'
    click_on 'Sign up'
    visit new_product_review_path(@product)
    fill_in 'review[author]', :with => 'Joanna'
    fill_in 'review[content]', :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut a."
    click_on 'Create Review'
    expect(page).to have_content "Rating can't be blank"
  end

  it "gives an error when review is too long" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    check 'user[admin]'
    click_on 'Sign up'
    visit product_path(@product)
    click_link 'Create new review'
    fill_in 'review[author]', :with => 'Samantha'
    find(id: 'star_3').click
    fill_in 'review[content]', :with => "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur."
    click_on 'Create Review'
    expect(page).to have_content 'Content is too long (maximum is 250 characters)'
  end

  it "gives an error when no review is too short" do
    visit '/'
    click_link 'Sign-In/Sign-Up'
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'test@epicodus.com'
    fill_in 'user[password]', :with => 'password'
    fill_in 'user[password_confirmation]', :with => 'password'
    check 'user[admin]'
    click_on 'Sign up'
    visit product_path(@product)
    click_link 'Create new review'
    fill_in 'review[author]', :with => 'Samantha'
    find(id: 'star_3').click
    fill_in 'review[content]', :with => "Lorem ipsum dolor sit amet, consectetur."
    click_on 'Create Review'
    expect(page).to have_content 'Content is too short (minimum is 50 characters)'
  end

end
