class UsersController < ApplicationController

  def index
  end

  def logout
  end

  def profile
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
    @products = Product.where(user_id: current_user.id).where(status: '出品中')
  end
  def trading
    @products = Product.where(user_id: current_user.id).where(status: '取引中')
  end
  def sold
    @products = Product.where(user_id: current_user.id).where(status: '売却済み')
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end