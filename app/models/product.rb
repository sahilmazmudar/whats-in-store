class Product < ApplicationRecord
	class << self
		def in_stock
			Product.all.select{ |product| product.inventory_count > 0}
		end
	end
end