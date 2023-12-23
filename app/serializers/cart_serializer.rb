class CartSerializer < ActiveModel::Serializer
   attributes :id, :quantity, :food_item

  belongs_to :food_item
  belongs_to :user
end
