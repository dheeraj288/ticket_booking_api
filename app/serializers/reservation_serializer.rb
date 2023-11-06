class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :date, :number_of_guests, :phone, :name, :email, :user_id
end
