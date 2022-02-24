class BillLine < ApplicationRecord
	belongs_to :bill
	belongs_to :menu

	monetize :price_cents
	monetize :tax_cents
	monetize :net_amount_cents


	after_save :update_rates, :update_bill_total

	def update_rates
		tax,net_amount,price = calculate_tax_and_amount_and_price
		self.update_column(:tax_cents, tax)
		self.update_column(:price_cents, price)
		self.update_column(:net_amount_cents, net_amount)
	end

	def update_bill_total
		rates = BillLine.where(bill_id: bill_id).select("sum (price_cents*quantity) as price ,sum (tax_cents*quantity) as tax,sum (net_amount_cents*quantity) as net_amount").group("bill_id")[0]
		bill.update_attributes(tax_total_cents: rates['tax'],price_total_cents: rates['price'],net_amount_total_cents: rates['net_amount']) if rates.present?
	end

	private

	def calculate_tax_and_amount_and_price

		tax = menu.tax_cents 
		price = menu.price_cents
		net_amount = price-tax
		return tax,net_amount,price
    end
end
