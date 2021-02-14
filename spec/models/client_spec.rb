require 'rails_helper'

RSpec.describe Client, type: :model do
  it { should have_many(:users).dependent(:destroy) }
  it { should belong_to(:country) }
  it { should belong_to(:client_status) }
  it { should belong_to(:group) }
  it { should belong_to(:group_position) }
  it { should belong_to(:team_project) }
  it { should belong_to(:team_position) }
  
end
