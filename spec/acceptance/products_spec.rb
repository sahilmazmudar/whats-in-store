require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Products' do
	get '/products.json' do
		example "Get a list of all products" do
			do_request

			status.should == 200
		end
	end

	get '/products/:id.json' do
		parameter :id, "Product ID"
		let(:product) { create(:product) }
		let(:id) { product.id }

		example "Get one product" do
			do_request

			status.should == 200
		end
	end

	put '/products/:id.json' do
		parameter :id, "Product ID"
		parameter :quantity, "Quantity to be purchased"
		let(:product) { create(:product) }
		let(:id) { product.id }
		let(:quantity) { "3" }

		example "Purchase a product" do
			do_request

			status.should == 200
		end
	end

	# put '/products/:id.json' do
	# 	parameter :id, "Product ID"
	# 	parameter :quantity, "Quantity to be purchased"
	# 	let(:product) { create(:product) }
	# 	let(:id) { product.id }
	# 	let(:quantity) { "2" }

	# 	example "Purchase a product" do
	# 		do_request

	# 		status.should == 200
	# 	end
	# end

	post '/products.json' do
		parameter :restock_new, "Set 'true' to clear store and add new items."
		let(:product) { create(:product) }
		let(:restock_new) { "true" }
		
		example "Restock all products" do
			do_request

			status.should == 200
		end
	end
end