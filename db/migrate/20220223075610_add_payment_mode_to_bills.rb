class AddPaymentModeToBills < ActiveRecord::Migration[5.0]
  def change
    add_column :bills, :payment_mode, :string
  end
end
