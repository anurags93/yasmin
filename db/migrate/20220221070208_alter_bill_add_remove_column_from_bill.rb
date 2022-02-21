class AlterBillAddRemoveColumnFromBill < ActiveRecord::Migration[5.0]
  def change
    remove_column :bills, :tax_total
    add_monetize :bills,  :tax_total, currency: { present: false }

  end
end
