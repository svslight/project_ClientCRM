require 'rails_helper'

RSpec.describe Client, type: :model do
  it { should belong_to(:country).optional }
  it { should belong_to(:group).optional }
  it { should belong_to(:group_position).optional }
  it { should belong_to(:team_position).optional }

  it { should have_one(:user).dependent(:destroy) }

  it { should have_many(:status_clients).dependent(:destroy) }
  it { should have_many(:status).through(:status_clients) }

  it { should have_many(:project_teams).dependent(:destroy) }
  it { should have_many(:project).through(:project_teams) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :surname }
  it { should validate_presence_of :patronymic }
  it { should validate_presence_of :birthdate }
  it { should validate_presence_of :city }
  it { should validate_presence_of :email }  
end
