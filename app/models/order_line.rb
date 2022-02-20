class OrderLine < ApplicationRecord
	belongs_to :order_summary
end
