class ChangeColumnTypeFromBillLines < ActiveRecord::Migration[5.0]
  def change
     add_monetize :bill_lines, :price, currency: { present: false }
     change_column :bill_lines, :tax_percent, :integer
  end
end
