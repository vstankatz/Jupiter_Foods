class Review < ApplicationRecord
  belongs_to :product
  validates :author, :content, :rating, :product_id, presence: true
  validates_length_of :content, maximum: 250, minimum: 50
  before_save(:titleize_author)

  private
  def titleize_author
    self.author = self.author.split(' ').map! { |w|
      (w[0] =~ /[a-z]/i) ? (w[0].upcase + w.slice(1, w.length)) : w
    }.join(' ')
  end

end
