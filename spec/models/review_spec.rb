require 'rails_helper'

describe Review do
it { should belong_to(:product) }
it { should validate_presence_of :author }
it { should validate_presence_of :rating }
it { should validate_presence_of :content }
it { should validate_presence_of :product_id }
it { should validate_length_of(:content).is_at_least(50) }
it { should validate_length_of(:content).is_at_most(250) }
it("titleizes the name of an author") do
  product = Product.create({name: "apple butter", origin: "USA", cost: 2.50})
  review = Review.create({author: "sam b. jones", content: "The apple butter was wonderful, would totally recommend.", rating: 4, product_id: product.id})
  puts review.author.split(' ').map! { |w|
    (w[0] =~ /[a-z]/i) ? (w[0].upcase + w.slice(1, w.length)) : w
  }.join(' ')
  expect(review.author()).to(eq("Sam B. Jones"))
end
end
