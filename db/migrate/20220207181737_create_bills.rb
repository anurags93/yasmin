class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
       t.belongs_to :order_summary
       t.integer :tax_total
       t.string  :bill_status
       t.datetime :date  
      t.timestamps
    end
  end
end
