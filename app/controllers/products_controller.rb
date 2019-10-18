class ProductsController < ApplicationController
  def index
    @products = Product.all.order('created_at DESC')
    @product_images = ProductImage.all.order('created_at DESC')
  end

  def show
    @product = Product.find(params[:id])
  end


  def new
    @parents = Category.where(ancestry: nil)
    @product = Product.new
    @product.product_images.build
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

  def pay
    @product = Product.find(params[:id])
    Payjp.api_key = 'sk_test_742b25b3c7d64d5f154f9605'
    charge = Payjp::Charge.create(
    :amount => @product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
    redirect_to products_complete_path
  end

  def complete
  end


  private
  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :condition_id, :shipping_fee_id, :shipping_method_id, :prefecture_id, :deliveryday_id, :price, :pay, product_images_attributes:[:id,:image]).merge(user_id: current_user.id)
  end

end
