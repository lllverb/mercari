class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :prefecture
  belongs_to :size, optional: true
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_method
  belongs_to :deliveryday
  has_many   :product_images,dependent: :delete_all
  accepts_nested_attributes_for :product_images, allow_destroy: true

end
