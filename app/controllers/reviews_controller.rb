class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render :index
    end

    def new
      @products = Product.all
      @review = Review.new
      render :new
    end

    def create
      @review = Review.new(review_params)
      if @review.save
        product = Product.find(params[:product_id])
        flash[:notice] = "#{review.author} your review for #{product.name} has been saved!"
      else
        render :new
      end
    end

    def edit
      @product = Product.find(params[:product_id])
      @review = Review.find(params[:id])
      redner :edit
    end

    def show
      @product = Product.find(params[:product_id])
      @review = Review.find(params[:id])
      render :show
    end

    def update
      @review = Review.find(params[:id])
      if @review.update(review_params)
        redirect_to reviews_path
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:product_id])
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to product_path
    end

    private
    def review_params
      params.require(:review).permit(:author, :rating, :content)
    end

end
