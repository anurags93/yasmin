class AddQuantityToBillLines < ActiveRecord::Migration[5.0]
  def change
    add_column :bill_lines, :quantity, :integer
  end
end
