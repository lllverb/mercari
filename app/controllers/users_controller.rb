class UsersController < ApplicationController

  def index
  end

  def logout
  end

  def profile
  end

  def show
    redirect_to root_path
  end

  def edit 
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def exhibiting
    @products = Product.where(user_id: current_user.id).where(status: ['出品中',"公開停止中"]).includes(:product_images)
  end
  def trading
    @products = Product.where(user_id: current_user.id).where(status: '取引中').includes(:product_images)
  end
  def sold
    @products = Product.where(user_id: current_user.id).where(status: '売却済み').includes(:product_images)
  end
  
  def bought
    @products = Purchase.where(user_id: current_user.id).includes(:product)
  end
  def ago
    @products = Purchase.where(user_id: current_user.id).includes(:product)
  end
  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end