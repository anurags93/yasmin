class Bill < ApplicationRecord
	has_many :bill_lines
	belongs_to :order_summary
    
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

   end
end
