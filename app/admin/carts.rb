ActiveAdmin.register Cart do
   permit_params :food_item_id, :quantity, :user_id

  index do
    selectable_column
    id_column
    column :food_item
    column :quantity
    column :user do |cart_item|
      cart_item.user.email
    end
    actions
  end

  form do |f|
    f.inputs 'Cart Item Details' do
      f.input :food_item
      f.input :quantity
      f.input :user
    end
    f.actions
  end
end
