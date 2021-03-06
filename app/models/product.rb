class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :origin, :cost, presence: true
  validates :cost, numericality: {greater_than: 0}
  validates_length_of :name, maximum: 100
  before_save(:titleize_name)
  before_save(:check_price)

  scope :local, -> { where("origin ilike ?", "%united states%")}

  scope :most_reviews, -> do (
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(25))
  end

  scope :most_reviews_short, -> do (
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1))
  end

  scope :start_letter, -> (letter_parameter) { where("name ilike ?", "#{letter_parameter}%")}

  scope :recently_added, -> do (
    where("created_at <=?", Time.now)
    .order("created_at DESC")
    .limit(25))
  end

  scope :recently_added_short, -> do (
    where("created_at <=?", Time.now)
    .order("created_at DESC")
    .limit(3))
  end

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
