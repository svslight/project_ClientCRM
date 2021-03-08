require 'rails_helper'

RSpec.describe Client, type: :model do
  it { should have_many(:users).dependent(:destroy) }
  it { should belong_to(:country).optional }
  it { should belong_to(:client_status).optional }
  it { should belong_to(:group).optional }
  it { should belong_to(:group_position).optional }
  it { should belong_to(:team_project).optional }
  it { should belong_to(:team_position).optional }

  it { should validate_presence_of :name }
  it { should validate_presence_of :surname }
  it { should validate_presence_of :patronymic }
  it { should validate_presence_of :birthdate }
  it { should validate_presence_of :city }
  it { should validate_presence_of :email }  
end
