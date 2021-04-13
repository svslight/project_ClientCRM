FactoryBot.define do
  factory :group do
    name { "MyString" }
    city { "MyString" }
    email { "MyString" }
    phon { "MyString" }
    skype { "MyString" }
    entry_date { Date.today }
    comments { "MyString" }
    country_id { 1 }        
    group_status_id { 1 }
  end

  trait :invalid do
    name { nil }
    city { nil }
    email { nil }
    phon { nil }
    skype { nil}
    entry_date { nil }
    country_id { nil }
    group_status_id { nil }
  end
end
