require 'rails_helper'

describe "scopes setup and teardown" do
  before :each do
    user = User.create(email: 'cool@cat.com', password: 'testing', admin: true)
    @product = Product.create({:name => "Apple Butter", :origin => "Argentina", :cost => 2.34, user_id: user.id})
    Review.create(author: 'Bilbo Baggins' , rating: 4, content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.' , product_id: @product.id, user_id: user.id)
  end


  describe "it views the products page through different scopes" do
    it 'should scope based off letter' do
      visit '/products?letter=A'
      expect(page).to have_content 'Apple Butter'

    end

    it 'should scope based off local' do
      visit '/products?sort=all'
      expect(page).to_not have_content 'No products to display.'

    end

    it 'should scope based off local' do
      visit '/products?sort=local'
      expect(page).to have_content 'No products to display.'

    end

    it 'should scope based off most reviews' do
      visit '/products?sort=most_reviews'
      expect(page).to have_css '.product_list_item', maximum: 25
    end

    it 'should scope based off most recently added' do
      visit '/products?sort=recently_added'
      expect(page).to have_css '.product_list_item', maximum: 25
    end
  end

end
