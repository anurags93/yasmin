class Bill < ApplicationRecord
	has_many :bill_lines
	belongs_to :order_summary
	has_many :payments
    
    monetize :price_total_cents
	monetize :tax_total_cents
	monetize :net_amount_total_cents

	

	include AASM

    
	aasm column: 'bill_status' do
		state :initiated, initial: true
		state :pending 
		state :completed

		event :pending do 
		transitions from: :initiated, to: :pending, after: :prepare_payment
		end    

		event :complete do 
		transitions from: :pending, to: :completed
		end
	end

 

   def prepare_payment 
	payment = payments.new
	payment.order_summary_id = order_summary.id
	payment.payment_mode = payment_mode
	payment.save
   end
end
