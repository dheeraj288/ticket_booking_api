ActiveAdmin.register Reservation do

  
  permit_params :date, :number_of_guests, :phone, :name, :email, :user_id
  scope :all
  scope :history
  scope :upcoming

 index do
    selectable_column
    id_column
    column :name 
    column :email
    column :number_of_guests
    column :phone
    column :date
    column :user_id
    actions
  end

  form do |f|
    f.inputs 'Reservation Details' do
      f.input :date
      f.input :number_of_guests
      f.input :phone
      f.input :name
      f.input :email
      f.input :user_id
    end
    f.actions
  end
end