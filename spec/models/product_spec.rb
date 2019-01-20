require 'rails_helper'

RSpec.describe Product, :type => :model do
	before(:all) do
		@product = create(:product)
	end
end