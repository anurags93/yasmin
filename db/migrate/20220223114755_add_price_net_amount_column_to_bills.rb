class AddPriceNetAmountColumnToBills < ActiveRecord::Migration[5.0]
  def change
    add_monetize :bills, :price_total, currency: { present: false }
    add_monetize :bills, :net_amount_total, currency: { present: false }
  end
end
