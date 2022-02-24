class AddResponseColumnToPayment < ActiveRecord::Migration[5.0]
  def change
     add_column :payments, :response, :jsonb, default: {}
  end
end
