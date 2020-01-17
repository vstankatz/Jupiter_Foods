require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :origin }
  it { should validate_length_of(:name).is_at_most(100) }
  it("titleizes the name of an product") do
    product = Product.create({name: "apple butter", origin: "USA", cost: 2.50})
    expect(product.name()).to(eq("Apple Butter"))
  end
  it("rounds the price to two decimals") do
    product = Product.create({name: "apple butter", origin: "USA", cost: 2.501})
    expect(product.cost()).to(eq(2.50))
  end
end
