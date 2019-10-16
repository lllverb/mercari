class ProductsController < ApplicationController
  def index
  end

  def show
  end


  def new
    @parents = Category.where(ancestry: nil)
  end

  def edit
  end


end
