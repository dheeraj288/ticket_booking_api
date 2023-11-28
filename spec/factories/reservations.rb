FactoryBot.define do
  factory :reservation do
    name { "Sample Reservation" }
    email { "sample@example.com" }
    date { DateTime.now }
    number_of_guests { 2 }
    phone { "1234567890" }
    association :user, factory: :user
  end
end


