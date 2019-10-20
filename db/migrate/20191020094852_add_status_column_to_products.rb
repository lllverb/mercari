class AddStatusColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :status, :string, default: "出品中"
  end
end
