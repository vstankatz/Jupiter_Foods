class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :origin, :cost, presence: true
  validates_length_of :name, maximum: 100
  before_save(:titleize_name)
  before_save(:check_price)

  private
def titleize_name
  self.name = self.name.split(' ').map! { |w|
    (w[0] =~ /[a-z]/i) ? (w[0].upcase + w.slice(1, w.length)) : w
  }.join(' ')
end

def check_price
  self.cost = self.cost.round(2)
end

end
