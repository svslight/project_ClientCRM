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
  
  describe 'update' do
    let!(:client) { create(:client, country: country, group_position: group_position, group: group, team_position: team_position) }
    let!(:country) { create(:country) }
    let!(:group_position) { create(:group_position) }
    let!(:team_position) { create(:team_position) }
    let!(:group_status) { create(:group_status) }
    let!(:group) { create(:group, country: country, group_status: group_status) }
    
    let!(:status) { create(:status) }
    let!(:status_client) { create( :status_client, client: client, status: status) }

    let!(:project) { create(:project) }
    let!(:project_team) { create( :project_team, client: client, project: project) }

    it 'status_client' do
      expect(client).to eq client
      expect(status_client).to eq status_client
    end

    it 'project_team' do
      expect(client).to eq client
      expect(project_team).to eq project_team
    end
  end
end
