FactoryBot.define do
  factory :team_position do
    name { "MyString" }

    trait :invalid do
      name { nil }
    end
  end
end
