class AddCartArrayToUsers < ActiveRecord::Migration[5.0]
  def change
     add_column :users, :cart_array, :jsonb, default: {}


     ###  {"2": 2, "3": 4}
  end
end
