class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :pay, :mine, :destroy]
  def index
    ladies = Category.find_by(name: "レディース").subtree_ids
    @ladies = Product.where(category_id: ladies).where(status: "出品中").limit(10).order('created_at DESC').includes(:product_images)
    mens = Category.find_by(name: "メンズ").subtree_ids
    @mens = Product.where(category_id: mens).where(status: "出品中").limit(10).order('created_at DESC').includes(:product_images)
    machines = Category.find_by(name: "家電・スマホ・カメラ").subtree_ids
    @machines = Product.where(category_id: machines).where(status: "出品中").limit(10).order('created_at DESC').includes(:product_images)
    toys = Category.find_by(name: "おもちゃ・ホビー・グッズ").subtree_ids
    @toys = Product.where(category_id: toys).where(status: "出品中").limit(10).order('created_at DESC').includes(:product_images)
  end

  def show
    @others_of_user = Product.where(user_id: @product.user_id).where.not(id: @product.id).limit(6)
    @others_of_category = Product.where(category_id: @product.category_id).where.not(id: @product.id).limit(6)
  end


  def new
    @parents = Category.where(ancestry: nil)
    @product = Product.new
    @product.product_images.build
    9.times{@product.product_images.build}
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
  
  def update
    if @product.user_id == current_user.id
      @product.update(product_params)
      redirect_to product_path(@product)
    end
  end

  def pay
    Payjp.api_key = ENV['TEST_SECRET_KEY']
    charge = Payjp::Charge.create(
    amount: @product.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    @purchase = Purchase.create(purchase_params)
    @product.update_attributes(status: "取引中")
    redirect_to products_complete_path
  end

  def confirmation
    @product = Product.find(params[:id])
  end
  
  def complete
  end

  def category_children
    @children = Category.find(params[:categoryFirst_id]).children
  end

  def category_grandchildren
    @grandchildren = Category.find(params[:categorySecond_id]).children
  end

  def mine
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else 
      render :mine
    end 
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :condition_id, :shipping_fee_id, :shipping_method_id, :prefecture_id, :deliveryday_id, :price, :pay, product_images_attributes:[:id, :image]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def purchase_params
    params.merge(user_id: current_user.id, product_id: @product.id).permit(:user_id, :product_id)
  end
end
