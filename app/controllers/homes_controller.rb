class HomesController < ApplicationController
  def index
    @products = Product.all
    @products_newest = Product.recently_added_short
    @products_most = Product.most_reviews_short
    render :index
  end
end
