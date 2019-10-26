class Product < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  belongs_to :prefecture, optional: true
  belongs_to :size, optional: true
  belongs_to :condition, optional: true
  belongs_to :shipping_fee, optional: true
  belongs_to :shipping_method, optional: true
  belongs_to :deliveryday, optional: true
  has_many   :product_images,dependent: :delete_all
  has_many   :purchases 
  has_many   :users, through: :purchases
  accepts_nested_attributes_for :product_images, allow_destroy: true
  
  enum status:{exhibit: 0, stop: 1, trade: 2, sold: 3}

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :detail, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :shipping_method_id, presence: true
  validates :prefecture_id, presence: true
  validates :deliveryday_id, presence: true
  validates :price, presence: true, format: {with: /\A\d{3,7}\z/, message: 'は半角数字で入力してください'}
  validates :status, presence: true
  validates :product_images, associated: true, presence: true

  def previous
    Product.where("id < ?",id).order("id DESC").first
  end

  def next
    Product.where("id > ?",id).order("id DESC").first
  end

  def previous
    Product.where("id < ?",id).order("id DESC").first
  end

  def next
    Product.where("id > ?", id).order("id ASC").first
  end

end
