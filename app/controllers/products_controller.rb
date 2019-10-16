class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
  end


  def new
    @parents = Category.where(ancestry: nil)
  end

  def create 
    @product = Product.new(product_params)
    binding.pry
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end


  private
  def product_params
    params.require(:product).permit(:name, :detail, :category, :condition, :shipping_fee, :shipping_method, :prefecture, :deliveryday, :price).merge(user: current_user.id)
  end

end
