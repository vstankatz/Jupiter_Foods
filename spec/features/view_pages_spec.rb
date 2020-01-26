require 'rails_helper'

describe "view pages" do

  before :each do
    user = User.create(email: 'cool@cat.com', password: 'testing', admin: true)
    @product = Product.create({:name => "Apple Butter", :origin => "USA", :cost => 2.34, user_id: user.id})
    @review = Review.create(author: 'Bilbo Baggins' , rating: 4, content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.' , product_id: @product.id, user_id: user.id)
end

  it "view all products" do
    visit  products_path
    expect(page).to have_content 'Apple Butter'
  end

  it "shows a specific product page" do
    visit  product_path(@product)
    expect(page).to have_content 'Market Price'
  end

  it "shows review page of a product" do
    visit product_review_path(@product, @review)
    expect(page).to have_content 'Bilbo Baggins'
  end

  it "redirects to review page of a product" do
    visit product_reviews_path(@product, @review)
    expect(page).to have_content 'All Products'
  end

end
