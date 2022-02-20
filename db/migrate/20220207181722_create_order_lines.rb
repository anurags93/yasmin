class CreateOrderLines < ActiveRecord::Migration[5.0]
  def change
    create_table :order_lines do |t|
       t.belongs_to :order_summary
       t.integer    :quantity
       t.belongs_to  :menu
       t.belongs_to  :tax
       t.float       :item_total
       t.datetime    :date  
      t.timestamps
    end
  end
end
