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
    params.require(:product).permit(:name, :detail, :category_id, :condition_id, :shipping_fee_id, :shipping_method_id, :prefecture_id, :deliveryday_id, :price).merge(user_id: current_user.id)
  end

end
