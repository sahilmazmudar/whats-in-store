FactoryBot.define do
  factory :shopping_cart do
    product { "" }
    total { "9.99" }
    completed { false }
  end
	factory :product do
		title {"Test Product"}
		price {45.50}
		inventory_count {5}
	end
end

