class AddPaymentModeColumnToOrderSummary < ActiveRecord::Migration[5.0]
  def change
     add_column :order_summaries, :payment_mode, :string
  end
end
