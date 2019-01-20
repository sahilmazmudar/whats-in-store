class ProductsController < ApplicationController
	respond_to :json

	# GET /products
	def index
		params[:in_stock] == "true" ? @products = Product.in_stock : @products = Product.all
		respond_to do |format|
			response = {status: 200, message: "Success", products: @products}
			format.json {render json: response}
		end
	end

	# GET /products/:id
	def show
		@product = Product.find(params[:id])
		respond_to do |format|
			response = {status: 200, message: "Success", product: @product}
			format.json {render json: response}
		end
	end

	# PUT /products/:id
	def update
		@product = Product.find(params[:id])
		quantity = params.has_key?(:quantity) ? params[:quantity].to_i : 1
		if @product.inventory_count < 1
			respond_to do |format|
				response = {status: 500, message: "Failed. Product out of stock.", product: @product}
			format.json {render json: response}
			end
		elsif @product.inventory_count < quantity
			respond_to do |format|
				response = {status: 500, message: "Failed. Current product inventory count #{@product.inventory_count} is less than quantity requested #{quantity}.", product: @product}
				format.json {render json: response}
			end
		else
			@product.update(inventory_count: @product.inventory_count - quantity)
			respond_to do |format|
				response = {status: 200, message: "Success. Inventory for #{@product.title} reduced by #{quantity}.", product: @product}
				format.json {render json: response}
			end
		end
	end

	# POST /products
	def create
		params[:restock_new] == "true" ? Product.restock(restock_new= true) : Product.restock
		respond_to do |format|
			response = {status: 200, message: "Success. Restocked store."}
			format.json {render json: response}
		end
	end
end
