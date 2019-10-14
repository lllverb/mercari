class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text   :detail, null:false
      t.references :user, null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true
      t.references :shipping_fee, null: false, foreign_key: true
      t.references :shipping_method, null: false, foreign_key: true
      t.references :prefecuture, null: false, foreign_key: true
      t.references :deliveryday, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :size, foreign_key: true
      t.timestamps
    end
  end
end