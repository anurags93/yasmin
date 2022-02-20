class CreateOrderSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :order_summaries do |t|
      t.belongs_to  :user
      t.string  :order_id
      t.belongs_to  :user_address
      t.string :order_status
      t.text :order_remark
      t.integer :order_total
      t.datetime :date
      t.timestamps
    end
  end
end
