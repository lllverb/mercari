class ProductsController < ApplicationController
  def index
    ladies = Category.find_by(name: "レディース").subtree_ids
    @products = Product.where(category_id: ladies).limit(10).order('created_at DESC').includes(:product_images)
    # @product_images = ProductImage.limit(10).order('created_at DESC')
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
    Payjp.api_key = ENV['TEST_SECRET_KEY']
    charge = Payjp::Charge.create(
    amount: @product.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    redirect_to products_complete_path
  end

  def complete
  end

  def category_children
    @children = Category.find(params[:categoryFirst_id]).children
  end

  def category_grandchildren
    @grandchildren = Category.find(params[:categorySecond_id]).children
  end


  private
  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :condition_id, :shipping_fee_id, :shipping_method_id, :prefecture_id, :deliveryday_id, :price, :pay, product_images_attributes:[:id,:image]).merge(user_id: current_user.id)
  end

end
