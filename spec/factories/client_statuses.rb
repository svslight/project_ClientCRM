FactoryBot.define do
  factory :client_status do
    name { "MyString" }

    trait :invalid do
      name { nil }
    end
  end
  
end
