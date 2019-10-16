class Product < ApplicationRecord
  belongs_to :user, foreign_key: 'user'
  belongs_to :category, foreign_key: 'category'
  belongs_to :prefecture, foreign_key: 'prefecture'
  belongs_to :size, foreign_key: 'size'
  belongs_to :condition, foreign_key: 'condition'
  belongs_to :shipping_fee, foreign_key: 'shipping_fee'
  belongs_to :shipping_method, foreign_key: 'shipping_method'
  belongs_to :deliveryday, foreign_key: 'deliveryday'
end
