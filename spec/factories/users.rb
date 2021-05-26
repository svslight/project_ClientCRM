FactoryBot.define do
  factory :user do
    email { "user@test.com" }
    password { '123456' }
    password_confirmation { '123456' }
    first_name { 'first_name' }
    last_name { 'last_name' }
    client_id { nil }
  end
end
