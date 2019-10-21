class HousenumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :house_number, :string
    add_column :users, :building_name, :string
  end
end
