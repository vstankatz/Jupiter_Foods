require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name, :cost, :origin }
  it { should validate_length_of(:name).is_at_most(100) }
  it("titleizes the name of an album") do
    album = Product.create({name: "giant steps", genre: "jazz"})
    expect(album.name()).to(eq("Giant Steps"))
  end
end
