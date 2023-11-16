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

  # other actions, filters, etc.

  controller do
    def scoped_collection
      super.includes(:user) # Include associated data as needed
    end
  end
end