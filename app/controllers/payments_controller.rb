class PaymentsController < ApplicationController



	def create
   @order=OrderSummary.new
   @order.order_address=params[:order_address]
   @order.user_id=current_user.id
   @order.save
   @order.pending!
   @order.complete!
	end
end