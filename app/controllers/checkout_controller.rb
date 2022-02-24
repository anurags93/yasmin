class CheckoutController < ApplicationController

	def create
		@order = OrderSummary.new
		@order.order_address = params[:order_address]
		@order.user_id = current_user.id
		order_id = "YS"+rand(99..9999).to_s+current_user.id.to_s+params[:order_address]
		@order.order_id = order_id
		@order.payment_mode = params[:payment_radio]
		@order.save
		@order.pending!
		@user = User.find(current_user.id)
		@user_address = UserAddress.find(params[:order_address])
		@order.complete!
		empty_cart_array(current_user.id)
		if (@order.payment_mode == "cod")
			render :template => 'payments/thankyou'
		else
			redirect_to payment_path(:id => @order.id , :address => @user_address.address,:pincode => @user_address.pincode, :username => @user.name ,:email => @user.email)
    end
	end


	def checkout
   
	    @user_addresses = UserAddress.where(user_id: current_user.id)
	    @address_count = UserAddress.where(user_id: current_user.id).count
			@menu=Menu.new
			@distinct_menu = Menu.all
			@cart_data = current_user.cart_array
			@item_total = 0
			@item_net_total = 0
			@item_tax_total = 0
			@items_array = {}
      @cart_data.each do |item_id,item_qty|
        @item_obj = @distinct_menu.find(item_id.to_i)
        @menu_items_with_taxes = @menu.items_with_tax(item_id)
        @item_total = @item_total+(@item_obj.price)*item_qty
        @item_net_total = @item_net_total+(@item_obj.net_amount)*item_qty
        @item_tax_total = @item_tax_total+(@item_obj.tax)*item_qty
     end
     
  end

  def empty_cart_array(user_id)
  	@user = User.find(user_id)
  	@user.cart_array = {}
  	@user.save
  end
    
end