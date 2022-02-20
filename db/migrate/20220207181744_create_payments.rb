class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
       t.belongs_to :order_summary
       t.string  :payment_mode
       t.integer :payment_id
       t.string  :payment_status
       t.datetime :date  
      t.timestamps
    end
  end
end
