FactoryBot.define do
  factory :user do
    date {'10-10-2022'}
    time {'12.30pm'}
    number_of_guests {'5'}
    name {Faker::Name.name_with_middle }
    email {Faker::Internet.email }
    number{ Faker::Phone::PhoneNumber.cell_phone_with_country_code }
  end
end
