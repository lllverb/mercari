class CreateShippingFees < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_fees do |t|
      t.string :content,null: false
      t.timestamps
    end
  end
end
