class Product < ApplicationRecord

	class << self
		def in_stock
			Product.all.select{ |product| product.inventory_count > 0}
		end

		def restock
			Product
			i = 0
			4.times do
				random_title = ('a'..'z').to_a.shuffle[0,8].join
				random_price = rand 2..500
				random_inventory = rand 2..50
				product = Product.create(title: "Product" + random_title,
										 price: random_price,
										 inventory_count: random_inventory)
			end
		end
	end
end