FactoryBot.define do
  factory :client do

    name { "MyString" }
    surname { "MyString" }
    patronymic { "MyString" }
    birthdate { Date.today }
    city { "MyString" }
    address { "MyString" }
    email { "MyString" }
    phon { "MyString" }
    skype { "MyString" }
    entry_date { Date.today }
    lesson_number { 1 }
    communicant_date { Date.today }
    comments { "MyString" }
    country_id { 1 }        
    client_status_id { 1 } 
    group_id { 1 }
    group_position_id { 1 }
    team_position_id { 1 }
    team_project_id { 1 }

    trait :invalid do
      name { nil }
      surname { nil }
      patronymic { nil }
      birthdate { nil }
      city { nil }
      email { nil }
      country_id { nil }        
      client_status_id { nil } 
      group_id { nil }
      group_position_id { nil }
      team_position_id { nil }
      team_project_id { nil }
    end
  end
end
