class AddBillIdToPayments < ActiveRecord::Migration[5.0]
  def change
    add_reference :payments, :bill, index: true
  end
end
