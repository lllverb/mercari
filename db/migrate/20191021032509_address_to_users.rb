class AddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postal_code, :string
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
  end
end
