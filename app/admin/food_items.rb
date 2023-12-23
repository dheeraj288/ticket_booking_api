# app/admin/food_items.rb
ActiveAdmin.register FoodItem do
  permit_params :name, :price, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :category
    actions
  end

  form do |f|
    f.inputs 'Food Item Details' do
      f.input :name
      f.input :price
      f.input :category
    end
    f.actions
  end
end
