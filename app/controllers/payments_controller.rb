class PaymentsController < ApplicationController

  def new
    
  end

  def show
    @order = OrderSummary.find params[:id]
    @bill = @order.bill
    @payment = @bill.payments.last
  end

  def create
    payment = Payment.find params[:payment_id]

    @amount = payment.bill.price_total.to_i
    customer = Stripe::Customer.create(
    email: params[:stripeEmail],
    source: params[:stripeToken],
    address: {"postal_code" => params[:pincode],"line1" => params[:address]},
    name: params[:username]
    )
    
    charge = Stripe::Charge.create(
    customer: customer.id,
    amount: @amount,
    description: 'Yasmin Restaurants',
    currency: 'GBP'
    )
    
    payment.response = charge
    payment.save
    payment.complete!

    render :template => 'payments/thankyou'
    rescue Stripe::CardError => e
      flash[:error] = e.message
      #redirect checkout
  end
end