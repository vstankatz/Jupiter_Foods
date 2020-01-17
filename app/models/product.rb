class Product < ApplicationRecord
  has_many :reviews, dependant: :destroy
end
