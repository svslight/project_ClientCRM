FactoryBot.define do
  factory :role do
    name { "MyString" }

    trait :invalid do
      name { nil }
    end
  end
end
