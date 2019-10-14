class CreateDeliverydays < ActiveRecord::Migration[5.2]
  def change
    create_table :deliverydays do |t|
      t.string :content, null: false
      t.timestamps
    end
  end
end
