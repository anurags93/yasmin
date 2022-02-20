class CreateBillLines < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_lines do |t|
      t.belongs_to :bill
      t.integer    :item_id
      t.float      :tax_percent
      t.monetize   :tax , currency: { present: false }
      t.monetize   :net_amount , currency: { present: false }  
      t.timestamps
    end
  end
end
