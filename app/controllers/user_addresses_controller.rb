class UserAddressesController < ApplicationController
  load_and_authorize_resource
def destroy
     @user_address=UserAddress.find(params[:id])
     @user_address.destroy
     redirect_to :back
  end
  

  def create
    @address=UserAddress.new
    @address.user_id=current_user.id
    @address.address=params[:address]
    @address.address_type=params[:address_options]
    @address.pincode=params[:pincode]

    if @address.save
      puts "Saved Succesfully"

    end
  end
end