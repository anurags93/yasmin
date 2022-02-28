class TaxLine < ApplicationRecord
	belongs_to :tax
	belongs_to :bill
end
