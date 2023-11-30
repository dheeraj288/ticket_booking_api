# spec/factories/admin_users.rb
FactoryBot.define do
  factory :admin_user do
    # Define attributes for your AdminUser model here
    email { 'admin@example.com' }
    password { 'password123' }
  end
end
