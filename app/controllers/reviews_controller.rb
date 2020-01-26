class ReviewsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]
before_action :authorize_admin, only: [:edit, :update, :destroy]
  def index
    @reviews = Review.all
    redirect_to products_path
    end

    def new
      @product = Product.find(params[:product_id])
      @review = @product.reviews.new
      render :new
    end

    def create
      @product = Product.find(params[:product_id])
      @review = @product.reviews.new(review_params)
      if @review.save
        flash[:notice] = "#{@review.author} your review for #{@product.name} has been saved!"
        redirect_to product_path(@product)
      else
        render :new
      end
    end

    def edit
      @product = Product.find(params[:product_id])
      @review = Review.find(params[:id])
      render :edit
    end

    def show
      @product = Product.find(params[:product_id])
      @review = Review.find(params[:id])
      @user = current_user
      render :show
    end

    def update
      @product = Product.find(params[:product_id])
      @review = Review.find(params[:id])
      if @review.update(review_params)
        redirect_to product_path(@review.product)
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:product_id])
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to product_path(@product)
    end

    private
    def review_params
      params.require(:review).permit(:author, :rating, :content)
    end

end
