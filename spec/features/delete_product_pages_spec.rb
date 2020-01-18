require 'rails_helper'
describe "product deletion" do
  before :each do
    @product = Product.create({:name => "Apple Butter", :origin => "USA", :cost => 2.34})
  end
  it "gives deletes a product" do
    visit product_path(@product)
    click_on 'Delete product'
    expect(page).to_not have_content "Apple Butter"
  end
end
