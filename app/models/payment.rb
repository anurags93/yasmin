class Payment < ApplicationRecord
	belongs_to :bill
	belongs_to :order_summary

	include AASM


	aasm column: 'payment_status' do
		state :pending, initial: true
		state :completed


		event :complete do
			transitions from: :pending, to: :completed, after: :complete_bill
		end
	end

	def complete_bill
		bill.complete!
	end
end
