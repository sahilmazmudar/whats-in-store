class ProductsController < ApplicationController
	respond_to :html, :js, :xml, :json

	# GET /products
	def index
		if params[:in_stock] == "true"
			@products = Product.in_stock
		else
			@products = Product.all
		end
		respond_to do |format|
			format.json {render json: @products}
		end
	end

	# GET /products/:id
	def show
		@product = Product.find(params[:id])
		respond_to do |format|
			format.json {render json: @product}
		end
	end

	# PUT /products/:id
	def update
		@product = Product.find(params[:id])
		@product.update(inventory_count: @product.inventory_count - 1)
	end
end
