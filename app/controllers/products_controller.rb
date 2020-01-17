class ProductsController < ApplicationController

  def index
    @products = Product.all
    if params[:sort]
      case params[:sort]
      when 'most_reviews'
        @products = Product.most_reviews
      when 'local'
        @products = Product.origin
      when 'recently_added'
        @products = Product.recently_added
      end
    end
    render :index
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "#{@product.name} has been saved to Products!"
        redirect_to products_path
      else
        render :new
      end
    end

    def edit
      @product = Product.find(params[:id])
    end

    def show
      @product = Product.find(params[:id])
      @reviews = @product.reviews
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to product_path
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
    end

    private
    def product_params
      params.require(:product).permit(:name, :cost, :origin)
    end
end
