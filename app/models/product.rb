class Product < ApplicationRecord

	class << self
		def in_stock
			Product.all.select{ |product| product.inventory_count > 0}
		end

		def restock(restock_new= false)
			if restock_new
				Product.delete_all
				Product.reset_pk_sequence
				5.times do
					random_title = ('a'..'z').to_a.shuffle[0,8].join
					random_price = rand 2..500
					random_inventory = rand 2..50
					product = Product.create(title: "Product " + random_title,
											 price: random_price,
											 inventory_count: random_inventory)
				end
			else
				Product.all.each do |product|
					if product.inventory_count == 0
						product.update(inventory_count: 50)
					end
				end
			end
		end
	end
end