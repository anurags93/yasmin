class BillLine < ApplicationRecord
	belongs_to :bill
	belongs_to :menu

	monetize :price_cents
	monetize :tax_cents
	monetize :net_amount_cents
end
