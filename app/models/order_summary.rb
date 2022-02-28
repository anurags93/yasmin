class OrderSummary < ApplicationRecord
	has_many :order_lines
  belongs_to :user
  has_one :bill

  include AASM

  aasm column: 'order_status' do
    state :initiated, initial: true
    state :pending 
    state :completed

    event :pending do 
      transitions from: :initiated, to: :pending, after: :prepare_order
    end    

    event :complete do 
      transitions from: :pending, to: :completed, after: :prepare_bill
    end
  end

	def prepare_order
    cart_items=user.cart_array
      cart_items.each do |key,value|
        orderline = order_lines.new
        orderline.quantity = value
        orderline.menu_id = key.to_i
        orderline.save
      end
  end
     
  
   def prepare_bill
     bill = Bill.new
     bill.order_summary_id = self.id
     bill.payment_mode = self.payment_mode
         order_lines.each do |item|
           bill_line = bill.bill_lines.new
           bill_line.menu_id = item.menu_id
           bill_line.quantity = item.quantity
           bill_line.price = bill_line.menu.price
           bill_line.tax = bill_line.menu.tax
           bill_line.net_amount = bill_line.menu.net_amount
           bill_line.tax_percent = bill_line.menu.menu_category.tax.gst
         end
     bill.save
     bill.pending!

     
          
   end
end
