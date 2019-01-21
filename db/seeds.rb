# Product table
Product.destroy_all
5.times do
	random_title = ('a'..'z').to_a.shuffle[0,7].join
	random_price = rand 2..500
	random_inventory = rand 2..50
	product = Product.create(title: "Product " + random_title,
							 price: random_price,
							 inventory_count: random_inventory)
end