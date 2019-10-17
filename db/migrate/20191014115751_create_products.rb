class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text   :detail, null:false
      t.references :user, null: false
      t.references :condition, null: false
      t.references :shipping_fee, null: false
      t.references :shipping_method, null: false
      t.references :prefecture, null: false
      t.references :deliveryday, null: false
      t.references :category, null: false
      t.references :brand, null: true
      t.references :size, null: true
      t.timestamps
    end
    add_foreign_key :products, :users, column: :user_id
    add_foreign_key :products, :conditions, column: :condition_id
    add_foreign_key :products, :shipping_fees, column: :shipping_fee_id
    add_foreign_key :products, :shipping_methods, column: :shipping_method_id
    add_foreign_key :products, :prefectures, column: :prefecture_id
    add_foreign_key :products, :deliverydays, column: :deliveryday_id
    add_foreign_key :products, :categories, column: :category_id
  end
end