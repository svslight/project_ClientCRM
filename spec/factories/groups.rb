FactoryBot.define do
  factory :group do
    name { "MyString" }
  end

  trait :invalid do
    country_id { nil }
    group_status_id { nil }
  end
end
