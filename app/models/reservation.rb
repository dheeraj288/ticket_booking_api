class Reservation < ApplicationRecord
  belongs_to :user
  validates :name, :email, :number_of_guests, presence:true
  validates :email, uniqueness:true
  validates :date, presence:true

  scope :history, -> { where('date <= ?', Time.now) }
  scope :upcoming, -> { where('date >= ?', Time.now) }

end
