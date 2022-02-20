class CartController < ApplicationController

	def destroy
    current_user.cart_array.delete(params[:id].to_s)
    if current_user.save
    	 @cart_data=current_user.cart_array
    	 @distinct_menu=Menu.all
    end
  end

  def update
      # item_id, quantity
      if params[:quantity] == 0

        current_user.cart_array.delete(params[:item_id])
      else
        current_user.cart_array[params[:item_id].to_i] = params[:quantity]
      end
     if current_user.save
        
      end
  end



 end