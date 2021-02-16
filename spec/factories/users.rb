FactoryBot.define do
  # sequence :email do |n|
  #   "user#{n}@test.com"
  # end

  factory :user do
    email { "user@test.com" }
    password { '123456' }
    password_confirmation { '123456' }
    # client_id { nil }
    # confirmed_at { Time.now }

    # trait :unconfirmed do
    #   confirmed_at { nil }
    # end
  end
end
