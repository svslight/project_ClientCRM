FactoryBot.define do
  factory :group_status do
    name { "MyString" }

    trait :invalid do
      name { nil }
    end
  end
end
