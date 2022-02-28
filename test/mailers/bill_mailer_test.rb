require 'test_helper'

class BillMailerTest < ActionMailer::TestCase
  def new_order_email
    # Set up a temporary order for the preview
    bill = Bill.new(payment_mode: "COD", message: "I want to place an order!")

    BillMailer.with(bill: bill).new_bill_email
  end
end
