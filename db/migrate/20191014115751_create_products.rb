class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text   :detail, null:false
      t.bigint :user, null: false, foreign_key: true
      t.bigint :condition, null: false, foreign_key: true
      t.bigint :shipping_fee, null: false, foreign_key: true
      t.bigint :shipping_method, null: false, foreign_key: true
      t.bigint :prefecture, null: false, foreign_key: true
      t.bigint :deliveryday, null: false, foreign_key: true
      t.bigint :category, null: false, foreign_key: true
      t.bigint :brand, foreign_key: true
      t.bigint :size, foreign_key: true
      t.timestamps
    end
  end
end