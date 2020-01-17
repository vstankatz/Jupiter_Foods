class Review < ApplicationRecord
  belongs_to :product
  validates :author, :content, :rating, presence: true
  validates_length_of :content, maximum: 250, minimum: 50
end
