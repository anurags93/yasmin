class PincodesController < ApplicationController
  load_and_authorize_resource
def check_pincode
    
    if Pincode.where(pincode: params[:address_zip].to_s).count !=0
    
      output = {'status' => 'success'}.to_json
      render :json => output
    else
      output = {'status' => 'fail'}.to_json
      render :json => output
    end
  end

end
