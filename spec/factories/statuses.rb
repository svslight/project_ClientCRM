FactoryBot.define do
  factory :status do
    name { "MyString" }

    trait :invalid do
      name { nil }
    end
  end
end
