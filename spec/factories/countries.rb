FactoryBot.define do
  factory :country do
    name { "MyString" }

    trait :invalid do
      name { nil }
    end
  end
end
