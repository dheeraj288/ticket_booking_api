FactoryBot.define do
  factory :cart do
    food_item { nil }
    quantity { 1 }
    user { nil }
  end
end
