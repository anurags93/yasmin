class OrderSummary < ApplicationRecord
	has_many :order_lines
  belongs_to :user


	include AASM


  aasm column: 'order_status' do
    state :initiated, initial: true
    state :pending 
    state :completed

    event :pending do 
      transitions from: :initiated, to: :pending, after: :prepare_order
    end    

    event :complete do 
      transitions from: :pending, to: :completed, before: :prepare_bill
    end
  end

	def prepare_order

    order_id="YS"+rand(99..9999).to_s+user.id.to_s+order_address

    cart_items=user.cart_array
    cart_items.each do |key,value|
      orderline=order_lines.new
      orderline.quantity=value
      orderline.menu_id=key.to_i
      orderline.save
	  end
	 end

   def prepare_bill
    # code
   end
end
